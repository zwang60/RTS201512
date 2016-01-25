package com.mercury.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.CreditCard;
import com.mercury.beans.Order;
import com.mercury.beans.Station;
import com.mercury.beans.Ticket;
import com.mercury.beans.TrainSchedule;
import com.mercury.beans.User;
import com.mercury.beans.UserRole;
import com.mercury.mail.MailUtil;
import com.mercury.service.CartService;
import com.mercury.service.CustomUserDetailsService;
import com.mercury.service.OrderService;
import com.mercury.service.RailwayService;

@Controller
public class UserController {
	private RailwayService railwayService;
	private CustomUserDetailsService customUserDetailsService;
	// private CartService cartService;
	private OrderService orderService;

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public CartService getCartService(HttpSession session) {
		CartService cartService = null;
		try {
			cartService = (CartService) session.getAttribute("cartService");
		} catch (Exception e) {

		} finally {
			if (cartService == null) {
				cartService = new CartService(session);
				session.setAttribute("cartService", cartService);
			}
		}
		return cartService;
	}

	public User getUser() {
		String username = CustomUserDetailsService.currentUserDetails()
				.getUsername();
		return this.customUserDetailsService.getPd()
				.findPersonByEmail(username);
	}

	public CustomUserDetailsService getCustomUserDetailsService() {
		return customUserDetailsService;
	}

	public void setCustomUserDetailsService(
			CustomUserDetailsService customUserDetailsService) {
		System.out
				.println("UserController.customUserDetailsService injection.");
		this.customUserDetailsService = customUserDetailsService;
	}

	public RailwayService getRailwayService() {
		return railwayService;
	}

	public void setRailwayService(RailwayService railwayService) {
		System.out.println("UserController.raiwayService injection.");
		this.railwayService = railwayService;
	}

	public List<CreditCard> getCreditCardsByUserId(@PathVariable int userId) {
		return this.customUserDetailsService.getCreditCardsByUserId(userId);
	}

	public List<Order> getOrdersByUserId(@PathVariable int userId) {
		return this.customUserDetailsService.getOrdersByUserId(userId);
	}

	@RequestMapping(value = "/member/hello", method = RequestMethod.GET)
	public @ResponseBody
	ModelAndView memberHello() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/hello");
		mav.addObject("title", "Hello, welcome to dashboard");
		mav.addObject("username", this.getUser().getEmail());
		return mav;
	}

	@RequestMapping(value = "/member/dashboard", method = RequestMethod.GET)
	public ModelAndView userDashBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/dashboard");
		mav.addObject("title", "Hello, "
				+ CustomUserDetailsService.currentUserDetails().getUsername()
				+ "! welcome to dashboard");
		mav.addObject("username", this.getUser().getEmail());
		mav.addObject("creditcard",this.getCreditCardsByUserId(this.getUser().getUserId()).size());
		mav.addObject("orders", this.getOrdersByUserId(this.getUser().getUserId()).size());
		return mav;
	}

	@RequestMapping(value = "/member/creditcard", method = RequestMethod.GET)
	public ModelAndView userCreditcard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/creditcard");
		mav.addObject("title", "Creditcard");
		mav.addObject("username", this.getUser().getEmail());
		return mav;
	}

	@RequestMapping(value = "/member/editcreditcard", method = RequestMethod.POST)
	public @ResponseBody
	int editStation(HttpServletRequest request, CreditCard card) {
		System.out.println(card);
		User user = this.getUser();
		card.setUser(user);
		this.customUserDetailsService.updateCreditCard(card);
		return card.getCardId();
	}

	@RequestMapping(value = "/member/creditcarddata", method = RequestMethod.GET)
	public @ResponseBody
	List<CreditCard> getCreditCard(HttpServletRequest request) {
		User user = this.getUser();
		return this.getCreditCardsByUserId(user.getUserId());
	}

	@RequestMapping(value = "/member/ticket", method = RequestMethod.GET)
	public ModelAndView queryticket() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/ticket");
		mav.addObject("title", "Search a ticket");
		mav.addObject("username", this.getUser().getEmail());
		System.out.println(CustomUserDetailsService.currentUserDetails()
				.getUsername());
		return mav;
	}

	@RequestMapping(value = "/register/newuser", method = RequestMethod.POST)
	public ModelAndView registerPage(@ModelAttribute("user") User user,
			BindingResult result) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login");
		mav.addObject("title", "This is register page.");
		UserRole ur = new UserRole(100, "ROLE_USER");
		user.setRole(ur);
		user.setEnable(false);
		user.setPassword(user.MD5Hashing(user.getPassword()));
		System.out.println(user.getFirstName());
		user.geneateActivationCode();
		while (this.customUserDetailsService.checkActivationCode(user
				.getActivation()) > 0) {
			user.geneateActivationCode();
		}
		MailUtil.sendMail(user);
		this.customUserDetailsService.saveUser(user);
		System.out.println(user);
		return mav;
	}

	@RequestMapping(value = "/resetpassword/reset", method = RequestMethod.GET)
	public ModelAndView resetpassword(String email) {
		System.out.println(email);
		ModelAndView mav = new ModelAndView();
		User user = this.customUserDetailsService.findbyemail(email);
		mav.setViewName("/hello2");
		user.setEnable(false);
		mav.addObject("title", "This is reset password page.");
		MailUtil.sendpasswordresetMail(user);
		System.out.println(user);
		return mav;
	}
	
	@RequestMapping(value = "/activate/{activation}", method = RequestMethod.GET)
	public ModelAndView activate(@PathVariable String activation) {
		ModelAndView mav = new ModelAndView();

		User user = this.customUserDetailsService.activeUser(activation);
		if (user == null) {
			mav.setViewName("/hello2");
			mav.addObject("title", "Activation code expired!");
			return mav;
		}
		mav.setViewName("/hello2");
		mav.addObject("title", "Congratulations, " + user.getEmail()
				+ "! Successfully activated!");
		user.setEnable(true);
		user.geneateActivationCode();
		while (this.customUserDetailsService.checkActivationCode(user
				.getActivation()) > 0) {
			user.geneateActivationCode();
		}
		this.customUserDetailsService.updateUser(user);
		System.out.println(user);
		return mav;
	}

	@RequestMapping(value = "/resetpassword/reset/{md5}", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView resetpassword1(@PathVariable String md5, String password) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(md5);
		User user = this.customUserDetailsService.findbypassword(md5);
		if (user == null) {
			mav.setViewName("/hello2");
			mav.addObject("title", "User not exsit!");
			return mav;
		}
		System.out.println(password);
		user.setPassword(user.MD5Hashing(password));
		this.customUserDetailsService.updateUser(user);
		mav.setViewName("/login");
		mav.addObject("title", "Congratulations, " + user.getEmail()
				+ "! Successfully change your password!");
		
		System.out.println(user);
		return mav;
	}

	@RequestMapping(value = "/member/orderData", method = RequestMethod.GET)
	public @ResponseBody
	List<Order> getOrderData() {
		return this.railwayService.getOd().queryOrdersByUserId(
				getUser().getUserId());
	}

	@RequestMapping(value = "/member/getticketbyorder", method = RequestMethod.POST)
	public @ResponseBody
	List<Ticket> getTicketByOrderNo(HttpServletRequest request) {
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		System.out.println(orderNo);
		return this.orderService.listTicketsByOrderNo(orderNo);
	}

	@RequestMapping(value = "/member/order", method = RequestMethod.GET)
	public ModelAndView memberOrder() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/order");
		mav.addObject("title", "Hello, "
				+ CustomUserDetailsService.currentUserDetails().getUsername());
		mav.addObject("username", this.getUser().getEmail());
		mav.addObject("orderHistory",
		this.getOrdersByUserId(this.getUser().getUserId()));
		return mav;
	}

	@RequestMapping(value = "/member/checkout", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView memberCheckout() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/checkout");
		mav.addObject("title", "Hello, "
				+ CustomUserDetailsService.currentUserDetails().getUsername());
		mav.addObject("username", this.getUser().getEmail());
		mav.addObject("orderHistory",
		this.getOrdersByUserId(this.getUser().getUserId()));
		return mav;
	}
	
	

	@RequestMapping(value = "/resource/order/submit/", method = RequestMethod.POST)
	public @ResponseBody
	Order memberSubmitOrder(HttpServletRequest request, HttpSession session) {
		String firstName = (String) request.getParameter("firstName");
		String lastName = (String) request.getParameter("lastName");
		String cardNo = (String) request.getParameter("cardNo");
		String cardType = (String) request.getParameter("cardType");
		String exp = (String) request.getParameter("exp");
		String billingAddr = (String) request.getParameter("billingAddr");
		String city = (String) request.getParameter("city");
		String state = (String) request.getParameter("state");
		int zip = Integer.parseInt(request.getParameter("zip"));

		User user = getUser();
		System.out.println("User ID:" + user.getUserId());
		CartService cs = (CartService) session.getAttribute("cartService");
		if (cs.isEmpty())
			return null;
		Order order = this.orderService.createOrder(user, firstName, lastName,
				cardType, cardNo, exp, billingAddr, city, state, zip);

		boolean isComplete = this.orderService.bookTickets(cs.getCartTickets(),
				order);
		if(isComplete)
			cs.getCartTickets().clear();
		order.setUser(null);
		return order;
	}
	
	@RequestMapping(value = "/member/cancel", method = RequestMethod.POST)
	public @ResponseBody
	void cancelOrder(HttpServletRequest request, HttpSession session) {
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		System.out.println("cancel "+ orderNo);
		User user = getUser();
		this.orderService.cancelOrder(orderNo);
	}

	@RequestMapping(value = "/member/order/get/total", method = RequestMethod.POST)
	public @ResponseBody
	double getOrderTotal(int orderId) {
		return this.orderService.getOrderTotalById(orderId);
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profile() {

		ModelAndView mav = new ModelAndView();

		if (this.customUserDetailsService.currentUserDetails() == null) {
			mav.setViewName("hello");
		}
		User user = this.getUser();

		if (user.getRole().getUserRoleId() == 100) {
			mav.setViewName("member/dashboard");
			mav.addObject("username", this.getUser().getEmail());

		}
		if (user.getRole().getUserRoleId() == 200) {
			mav.setViewName("admin/dashboard");
			mav.addObject("count", this.customUserDetailsService.countUser());
			mav.addObject("actived", this.customUserDetailsService.countActivedUser());
		}
		return mav;
	}

	@RequestMapping(value = "/member/ticket/get/order", method = RequestMethod.POST)
	public @ResponseBody
	List<Ticket> getTicketsByOrderId(int orderId) {
		return this.orderService.listTicketsByOrderNo(orderId);
	}

	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
	public ModelAndView adminDashBoard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/dashboard");
		mav.addObject("title", "Hello admin, welcome to dashboard");
		int count = this.customUserDetailsService.countUser();
		System.out.println(count);
		List<TrainSchedule> tsl = this.railwayService.getAllSchedule();
		mav.addObject("count", count);
		mav.addObject("station", this.railwayService.getStations().size());
		mav.addObject("orders", this.railwayService.getOd().queryAllOrders().size());
		mav.addObject("trains", this.railwayService.getTd().queryAll().size());
		mav.addObject("train1", tsl.get(0).getAvailableTickets());
		mav.addObject("train2", tsl.get(4).getAvailableTickets());
		mav.addObject("train3", tsl.get(10).getAvailableTickets());
		mav.addObject("train4", tsl.get(27).getAvailableTickets());
		mav.addObject("actived", this.customUserDetailsService.countActivedUser());
		return mav;
	}
	@RequestMapping(value="/admin/userTable", method = RequestMethod.GET)
	public ModelAndView userTable() {
		ModelAndView mav = new ModelAndView();
		List<User> list = customUserDetailsService.findAllUser();
		mav.addObject("userTable", list);
		mav.setViewName("/admin/userTable");
		return mav;
	}
	@RequestMapping(value = "/admin/pie", method = RequestMethod.GET)
	public ModelAndView pie() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/pie");
		mav.addObject("title", "Hello admin, welcome to dashboard");
		int count = this.customUserDetailsService.countUser();
		System.out.println(count);
		mav.addObject("count", count);
		mav.addObject("actived", this.customUserDetailsService.countActivedUser());
		return mav;
	}
}