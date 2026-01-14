/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tools;

/**
 *
 * @author Shiryu
 */
public class getdata{
public static String user() {
    String user="root";
    return user;
    }
public static String password() {
    String pass="root1234";
       return pass;
    }
public static String url() {
       String url="jdbc:mysql://localhost:3306/woa";
    return url;
    }
public static String photopath() {
       String url="D:\\Project\\Application\\world_of_art\\web\\Database";
    return url;
    }
public static String ppath() {
       String url="D:/Project/Application/world_of_art/web";
    return url;
    }
public static String datapath() {
       String url="/Database";
    return url;
    }
public static int commission(int i){
    int interest=i/100;
    if(i>0&&i<=500)
    {    interest=0;
}
    if(i>500&&i<=1000)
    {    interest=interest*5;
}
    if(i>1000&&i<=2000)
    {    interest=interest*7;
}
    if(i>2000&&i<=5000)
    {    interest=interest*10;
}
    if(i>5000&&i<=10000)
    {    interest=interest*12;
}
    if(i>10000)
    {    interest=interest*15;
}
return interest;
}


}
