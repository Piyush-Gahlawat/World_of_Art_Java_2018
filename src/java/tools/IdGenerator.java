/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tools;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Shiryu
 */

public class IdGenerator {
	public static String uniqueid(){
		Date dNow=new Date();
		SimpleDateFormat ft=new SimpleDateFormat("YYMMDDmmss");
		String datetime=ft.format(dNow);
		return datetime;
	}
	public static String artid(){
		Date dNow=new Date();
		SimpleDateFormat ft=new SimpleDateFormat("YYDDMMssmm");
		String datetime=ft.format(dNow);
		return datetime;
	}
	public static String orderid(){
		Date dNow=new Date();
		SimpleDateFormat ft=new SimpleDateFormat("YYMMssmmDD");
		String datetime=ft.format(dNow);
		return datetime;
	}
	public static String unique(){
		Date dNow=new Date();
		SimpleDateFormat ft=new SimpleDateFormat("YYDDMMssmmSSms");
		String datetime=ft.format(dNow);
		return datetime;
	}
}
