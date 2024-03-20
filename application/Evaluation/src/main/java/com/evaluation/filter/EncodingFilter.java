/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 *
 * @author ΑΝΑΣΤΑΣΙΟΣ
 */
@WebFilter(filterName="encodingFilter", urlPatterns ={"/*"})
public class EncodingFilter implements Filter {

    public EncodingFilter() {}
    
    @Override
    public void init(FilterConfig fConfig)throws ServletException{}
    
    @Override
    public void destroy(){}
    
    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) 
            throws IOException, ServletException {
        sr.setCharacterEncoding("UTF-8");
        sr1.setCharacterEncoding("UTF-8");
        fc.doFilter(sr, sr1);
    }//doFilter 
}//class

