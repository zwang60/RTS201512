package com.mercury.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Order;
import com.mercury.beans.Station;
import com.mercury.beans.Ticket;
import com.mercury.beans.Train;
import com.mercury.beans.TrainSchedule;
import com.mercury.beans.Transit;
import com.mercury.beans.User;
import com.mercury.service.CartService;
import com.mercury.service.RailwayService;
import com.mercury.service.TicketContainer;
import com.mercury.utils.JavaUtil;


@Controller
public class RTSController {
	
	
	private static final Logger logger = Logger.getLogger(RTSController.class);

	
	private RailwayService railwayService;
	//private CartService cartService;
	
	public CartService getCartService(HttpSession session) {
		CartService cartService = null;
		try{
			cartService = (CartService)session.getAttribute("cartService");
		}catch(Exception e){
			
		}finally{
			if(cartService==null){
				cartService = new CartService(session);
				session.setAttribute("cartService", cartService);
			}
		}
		return cartService;
	}

	public RailwayService getRailwayService() {
		return railwayService;
	}

	@PostConstruct
	public void setRailwayService(RailwayService railwayService) {
		this.railwayService = railwayService;
	}

	@RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(HttpServletRequest request, ModelMap model) {
		 String referrer = request.getHeader("Referer");
		 System.out.println(referrer);
		 request.getSession().setAttribute("url_prior_login", referrer);
		 return "login";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String hello(HttpServletRequest request, ModelMap model) {
		 return "hello";
	}
	
	@RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
	public String resetpassword(ModelMap model) {
		return "resetpassword";
	}
	@RequestMapping(value = "/resetpassword/{md5}", method = RequestMethod.GET)
	public ModelAndView resetpasswordemail(ModelMap model, @PathVariable String md5) {
		System.out.println(md5);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resetpassword1");
		mav.addObject("md5", md5);
	
		return mav;
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/hello2");
		mav.addObject("title", "This is main page.");
		return mav;
	}
	@RequestMapping(value="main1", method=RequestMethod.GET)
	public String hello1() {
		return "hello2";
	}




	@RequestMapping(value = "/admin/order", method = RequestMethod.GET)
	public ModelAndView adminOrder() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/order");
		mav.addObject("title", "Hello admin, welcome to order");
		//mav.addObject("order", this.railwayService.queryAll());
		return mav;
	}
	

	@RequestMapping(value = "/admin/orderData", method = RequestMethod.GET)
	public @ResponseBody
	List<Order> getOrderData() {
		return this.railwayService.getOd().queryAllOrders();
	}
	
	@RequestMapping(value = "/admin/schedule", method = RequestMethod.GET)
	public ModelAndView adminSchedule() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/schedule");
		mav.addObject("title", "Hello admin, welcome to schedule");
		return mav;
	}

	@RequestMapping(value = "/admin/scheduleData", method = RequestMethod.GET)
	public @ResponseBody
	List<TrainSchedule> getScheduleData() {
		return this.railwayService.getAllSchedule();
	}

	
	/*******************************
	*	Station operation
	******************************/
	
	@RequestMapping(value = "/admin/station", method = RequestMethod.GET)
	public ModelAndView adminStation() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/station");
		mav.addObject("title", "Hello admin, welcome to station");
		//mav.addObject("station", this.railwayService.getStations());
		return mav;
	}

	@RequestMapping(value = "/admin/removeStation", method = RequestMethod.POST)
	public @ResponseBody
	int removeStation(HttpServletRequest request, Station station) {
		System.out.println(station);
		this.railwayService.deleteStation(station);
		return station.getStationNo();
	}
	
	@RequestMapping(value = "/admin/addStation", method = RequestMethod.POST)
	public @ResponseBody
	int addStation(HttpServletRequest request, Station station) {
		this.railwayService.addStation(station);
		return station.getStationNo();
	}
	
	@RequestMapping(value = "/admin/editStation", method = RequestMethod.POST)
	public @ResponseBody
	int editStation(HttpServletRequest request, Station station) {
		System.out.println(station);
		this.railwayService.updateStation(station);
		return station.getStationNo();
	}

	
	/*******************************
	*	Train operation
	******************************/
	
	@RequestMapping(value = "/admin/submitTrain", method = RequestMethod.POST)
	public ModelAndView submitTrain(HttpServletRequest request, Train train) {
		ModelAndView mav = new ModelAndView();

		if (request.getParameter("add") != null){
			this.railwayService.addTrain(train);
			System.out.println(train);	
			mav.setViewName("/admin/transit");
			mav.addObject("title", "Add Transit for train #" + train.getTrainNo());
		}
		else if (request.getParameter("delete") != null){
			this.railwayService.deleteTrain(train);
			mav.setViewName("/admin/train");
		}
		else if (request.getParameter("update") != null){
			this.railwayService.updateTrain(train);
			mav.setViewName("/admin/transit");
			mav.addObject("title", "Add Transit for train #" + train.getTrainNo());
		}
		TicketContainer.update(train);
		return mav;
	}
	
	@RequestMapping(value = "/admin/train", method = RequestMethod.GET)
	public ModelAndView adminTrain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/train");
		mav.addObject("title", "Hello admin, welcome to train");
		return mav;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/admin/submitTransit", method = RequestMethod.POST)
	public ModelAndView submitTransit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (request.getParameter("add") != null){
			System.out.println(request.getParameter("trainNo"));
			//this.railwayService.addTrain(train);
			int trainNo = Integer.parseInt(request.getParameter("trainNo"));
			int seqNo = Integer.parseInt(request.getParameter("seqNo"));
			int stationNo = Integer.parseInt(request.getParameter("stationNo"));
			Date arrivalTime = new Date();
			arrivalTime = JavaUtil.convertDateTimeWithoutDate(arrivalTime);
			arrivalTime.setHours(Integer.parseInt(request.getParameter("hour")));
			arrivalTime.setMinutes(Integer.parseInt(request.getParameter("minute")));
			int stopDuration = Integer.parseInt(request.getParameter("stopDuration"));
			double price = Double.parseDouble(request.getParameter("price"));
			
			this.railwayService.addTransit(trainNo, seqNo, stationNo, new java.sql.Timestamp(arrivalTime.getTime()), stopDuration, price);
			mav.setViewName("/admin/transit");
			mav.addObject("title", "Add Transit for train #" + request.getParameter("trainNo"));
		}

		else if (request.getParameter("end") != null){
			//this.railwayService.addTrain(train);
			mav.setViewName("/admin/train");
			mav.addObject("title", "Hello admin, welcome to train");
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/resource/countticket/{trainNo}-{yyyy}-{mm}-{dd}", method = RequestMethod.GET)
	public ModelAndView countticket(@PathVariable int trainNo,@PathVariable int yyyy,@PathVariable int mm,@PathVariable int dd){
		System.out.println(trainNo);
		System.out.println(yyyy);
		System.out.println(mm);
		System.out.println(dd);
	
		Date date = new Date();
		date.setYear(yyyy-1900);
		date.setMonth(mm-1);
		date.setDate(dd);

		System.out.println(date);
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/countticket");
		mav.addObject("title", "Tickets for Train "+trainNo+" on " + yyyy +"/"+ mm +"/"+ dd);
		Train train = this.railwayService.loadTrainByNo(trainNo);
		TrainSchedule trainSchedule = this.railwayService.getTrainAvailableTickets(new TrainSchedule(train, date));
		trainSchedule = this.railwayService.getTrainAvailableTickets(trainSchedule);
		int avaliable = trainSchedule.getTrain().getTotalTicketQty() - this.railwayService.queryCountByTrainAndDate(trainSchedule);
		trainSchedule.setAvailableTickets(avaliable);
		mav.addObject("available", trainSchedule.getAvailableTickets());
		mav.addObject("sold", trainSchedule.getTrain().getTotalTicketQty() - trainSchedule.getAvailableTickets());
		return mav;
	}
	
	/**
	 * Search available ticket by date and transit
	 * @return
	 */
	@RequestMapping(value = "/searchbydate", method = RequestMethod.GET)
	public ModelAndView queryTicket() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search");
		return mav;
	}
	

	@RequestMapping(value = "/search/{departureStation}/{arrivalStation}/{departureDate}", method = RequestMethod.GET)
	public ModelAndView queryTicket2(@PathVariable int departureStation,
			@PathVariable int arrivalStation,
			@PathVariable long departureDate) {
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date dDate = new Date(departureDate);
		String sDepartureDate = formatter.format(dDate);
		System.out.println(departureStation + " | " + arrivalStation + " | " + sDepartureDate);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/search");
		mav.addObject("departureStation", departureStation );
		mav.addObject("arrivalStation", arrivalStation );
		mav.addObject("departureDate", sDepartureDate );
		return mav;
	}
	
	


	
	/**
	 * Search available ticket by date and transit
	 * @return
	 */
	@RequestMapping(value = "/viewcart", method = RequestMethod.GET)
	public ModelAndView viewCart() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/cart");
		mav.addObject("title", "View Cart" );

		return mav;
	}

	@RequestMapping(value = "/resource/station/get/all", method = RequestMethod.GET)
	public @ResponseBody
	List<Station> getStations() {
		List<Station> list = this.railwayService.getStations();
		return list;
	}

	
	@RequestMapping(value = "/resource/station/get/by-departure", method = RequestMethod.POST)
	public @ResponseBody
	List<Station> getStationByDeparture(int departureStationId) {
		List<Station> list = this.railwayService.getStations();
		return list;
	}
	
	
	@RequestMapping(value = "/resource/train/get/all", method = RequestMethod.GET)
	public @ResponseBody
	List<Train> getTrainList() {
		return this.railwayService.loadTains();
	}
	
	 
	@RequestMapping(value = "/resource/train/get/by-stations-date", method = RequestMethod.POST)
	public @ResponseBody
	List<Train> getTrainListByStationsAndDate1(HttpServletRequest request) {

		int departureStation = Integer.parseInt(request.getParameter("departureStation")); 
		int arrivalStation = Integer.parseInt(request.getParameter("arrivalStation"));
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date departureDateTime = new Date();
		try {
			departureDateTime = formatter.parse(request.getParameter("departureDateTime"));
			System.out.println( "" + departureStation + " " + arrivalStation + departureDateTime.toString());

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return this.railwayService.getTrainsByStationsAndDate(departureStation,arrivalStation,departureDateTime);
	}

	/***
	 * Get quantity of available tickets for the trainNo
	 * @param request
	 * @return
	 */
	@RequestMapping(value= "/resource/ticket/get/count-by-train-date", method = RequestMethod.POST)
	public @ResponseBody
	TrainSchedule getTicketCountByTrainAndDate(HttpServletRequest request){
		int trainNo = Integer.parseInt(request.getParameter("trainNo")); 
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date departureDateTime = new Date();
		try {
			departureDateTime = formatter.parse(request.getParameter("departureDateTime"));
			System.out.println( "" + trainNo + " "  + departureDateTime.toString());

		} catch (ParseException e) {
			e.printStackTrace();
		}
		Train train = this.railwayService.loadTrainByNo(trainNo);
		TrainSchedule schedule = new TrainSchedule(train, departureDateTime);
		this.railwayService.getTrainAvailableTickets(schedule);
		return schedule;
	}
	
	/***
	 * Get transits/schedule with departureStation, arrivalStation and departureDateTime
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/resource/schedule/get/by-stations-date", method = RequestMethod.POST)
	public @ResponseBody
	List<TrainSchedule> getScheduleListByStationsAndDate(HttpServletRequest request) {

		int departureStation = Integer.parseInt(request.getParameter("departureStation")); 
		int arrivalStation = Integer.parseInt(request.getParameter("arrivalStation"));
		Date departureDate = new Date(Long.parseLong(request.getParameter("departureDate")));
		//System.out.println(departureDate.getTime());
		return this.railwayService.getScheduleListByTrainAndDate(departureStation, arrivalStation, departureDate);
	}

	@RequestMapping(value = "/resource/transit/get/all", method = RequestMethod.GET)
	public @ResponseBody
	List<Transit> getTransitList() {
		return this.railwayService.loadTransits();
	}

	@RequestMapping(value = "/resource/transit/get/by-station/", method = RequestMethod.GET)
	public @ResponseBody
	List<Transit> getTransitListByStationNo(@RequestParam int stationNo) {
		return this.railwayService.getTransitsByStationNo(stationNo);
	}

	@RequestMapping(value = "/resource/transit/get/by-train/", method = RequestMethod.POST)
	public @ResponseBody
	List<Transit> getTransitListByTrainNo(HttpServletRequest request) {
		int trainNo = Integer.parseInt(request.getParameter("trainNo")); 
		return this.railwayService.getTransitsByTrainNo(trainNo);
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		return "register";
	}
    
	/*test page*/
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(ModelMap model) {
		return "test";
	}
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String header(ModelMap model){
		return "header";
	}
	
	@RequestMapping(value = "/sidebar", method = RequestMethod.GET)
	public String sidebar(ModelMap model){
		return "sidebar";
	}
	/***
	 * Get ticket price by departureStationNo, arrivalStationNo and trainNo
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/resource/ticket/get/price/by-stations-train/", method = RequestMethod.POST)
	public @ResponseBody
	double getTicketPriceByStationsAndTrainNo(HttpServletRequest request) {
		int departureStation = Integer.parseInt(request.getParameter("departureStation")); 
		int arrivalStation = Integer.parseInt(request.getParameter("arrivalStation"));
		int trainNo = Integer.parseInt(request.getParameter("trainNo")); 
		
		return this.railwayService.getTicketPriceByStationsAndTrainNo(departureStation,arrivalStation, trainNo);
	}
	
	/***
	 * Add tickets with quantity into cart
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/resource/cart/add/ticket", method = RequestMethod.POST)
	public @ResponseBody
	int addTicketIntoCart(HttpServletRequest request, HttpSession session) {
		int departureStation = Integer.parseInt(request.getParameter("departureStation")); 
		int arrivalStation = Integer.parseInt(request.getParameter("arrivalStation"));
		int trainNo = Integer.parseInt(request.getParameter("trainNo")); 
		Date departureDate = new Date(Long.parseLong(request.getParameter("departureDateTime")));
		int qty = Integer.parseInt(request.getParameter("qty")); 
		System.out.println("Add ticket qty:"+qty);
		this.getCartService(session).addTicket(
				this.railwayService.getTransitByStationAndTrainNo(departureStation, trainNo),
				this.railwayService.getTransitByStationAndTrainNo(arrivalStation, trainNo), 
				trainNo, 
				this.railwayService.getTicketPriceByStationsAndTrainNo(departureStation, arrivalStation, trainNo),
				departureDate,
				qty);
		System.out.println("Cart size after add:" + this.getCartService(session).getCartTickets().size());
		return this.getCartService(session).getCartTicketsQty();
	}
	
	@RequestMapping(value = "/resource/cart/get/all", method = RequestMethod.POST)
	public @ResponseBody Set<Map.Entry<Ticket, Integer>> queryCart(HttpServletRequest request, HttpSession session) {
		return this.getCartService(session).getCartTickets().entrySet();
	}
	
	@RequestMapping(value = "/resource/cart/get/qty", method = RequestMethod.POST)
	public @ResponseBody int queryCartQty(HttpServletRequest request, HttpSession session) {
		return this.getCartService(session).getCartTicketsQty();
	}
	
	@RequestMapping(value = "/resource/cart/update/ticket", method = RequestMethod.POST)
	public @ResponseBody
	int updateTicketInCart(HttpServletRequest request, HttpSession session) {
		int departureStation = Integer.parseInt(request.getParameter("departureStation")); 
		int arrivalStation = Integer.parseInt(request.getParameter("arrivalStation"));
		int trainNo = Integer.parseInt(request.getParameter("trainNo")); 
		Date departureDate = new Date(Long.parseLong(request.getParameter("departureDateTime")));
		System.out.println(departureDate);
		int qty = Integer.parseInt(request.getParameter("qty")); 
		
		this.getCartService(session).updateTicketQty(
				this.railwayService.getTransitByStationAndTrainNo(departureStation, trainNo),
				this.railwayService.getTransitByStationAndTrainNo(arrivalStation, trainNo), 
				trainNo, 
				this.railwayService.getTicketPriceByStationsAndTrainNo(departureStation, arrivalStation, trainNo),
				departureDate,
				qty);
		System.out.println("Cart size after add:" + this.getCartService(session).getCartTickets().size());
		return this.getCartService(session).getCartTicketsQty();
	}
	
	
	@RequestMapping(value = "/resource/cart/remove/ticket", method = RequestMethod.POST)
	public @ResponseBody
	int removeTicketInCart(HttpServletRequest request, HttpSession session) {
		int departureStation = Integer.parseInt(request.getParameter("departureStation")); 
		int arrivalStation = Integer.parseInt(request.getParameter("arrivalStation"));
		int trainNo = Integer.parseInt(request.getParameter("trainNo")); 
		Date departureDate = new Date(Long.parseLong(request.getParameter("departureDateTime")));
		System.out.println(departureDate);
		
		this.getCartService(session).removeTicketEntry(
				this.railwayService.getTransitByStationAndTrainNo(departureStation, trainNo),
				this.railwayService.getTransitByStationAndTrainNo(arrivalStation, trainNo), 
				trainNo, 
				departureDate);
		System.out.println("Cart size after add:" + this.getCartService(session).getCartTickets().size());
		return this.getCartService(session).getCartTicketsQty();
	}

}