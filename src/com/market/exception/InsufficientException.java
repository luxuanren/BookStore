package com.market.exception;

import java.util.ArrayList;

@SuppressWarnings("serial")
public class InsufficientException extends Exception {
	private ArrayList<String> list = new ArrayList<String>();
	public InsufficientException(ArrayList<String> inSufList) {
		this.list = inSufList;
	}
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer("�����������⣬��ȷ�ϲ��޸Ķ�����\n");
		for (String string : list) {
			sb.append(string).append("\n");
		}
		return sb.toString();
	}
}
