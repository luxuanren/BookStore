package com.market.exception;

import java.util.ArrayList;

import com.market.beans.TradeItem;

@SuppressWarnings("serial")
public class InsufficientException extends Exception {
	private ArrayList<TradeItem> list = new ArrayList<TradeItem>();
	public ArrayList<TradeItem> getList() {
		return list;
	}
	public InsufficientException(ArrayList<TradeItem> inSufList) {
		this.list = inSufList;
	}
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer("<p>由于以下问题，请确认并修改订单。</p>");
		for (TradeItem tradeItem : list) {
			sb.append("<p>[" + tradeItem.getTitle() + "] 库存为：" + tradeItem.getNum()).append("</p>");
		}
		return sb.toString();
	}
}
