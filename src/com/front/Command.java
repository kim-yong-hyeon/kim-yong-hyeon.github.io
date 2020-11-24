package com.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	public String execut(HttpServletRequest request, HttpServletResponse response);
}
