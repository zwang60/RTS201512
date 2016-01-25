package com.mercury.dao;

import java.util.List;

import com.mercury.beans.CreditCard;

public interface CreditCardDao {
	public void save(CreditCard card);
	public List<CreditCard> queryAll();
	public void delete(CreditCard card);
	public void update(CreditCard card);
	public List<CreditCard> queryCardByUserId(int userId);
	public CreditCard queryCardByUserIdAndNo(int userId, String ccNo);
	public CreditCard queryCardById(int cardId);
}
