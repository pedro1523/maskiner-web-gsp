package com.maskiner.smc.seguridad.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class MSKSessionExpiredInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1385369782900105740L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if(session.get("usuariologueado")==null){
			return "session-expired";
		}
		
		return invocation.invoke();
	}

}
