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
public class search_query {
String y="toggled";
String n="not toggled";
    String i(int i){
    if(i>0){
        return y; 
    }else
        return n;
}
String s(String i){
    if(!(i.length()==0)){
        return y; 
    }else
        return n;
}

    public search_query() {
    }

    public String search_query(int mn,int mx,String at,String al) {
    String query;
            if(i(mn).equals(n)&&i(mx).equals(n)&&s(at).equals(n)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0'";
    }else
            if(i(mn).equals(n)&&i(mx).equals(n)&&s(at).equals(y)&&s(al).equals(n)){            
                query="select * from artdb where art_type='"+at+"'";
            }else
            if(i(mn).equals(n)&&i(mx).equals(n)&&s(at).equals(y)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0' and art_type='"+at+"'";
    }else
            if(i(mn).equals(n)&&i(mx).equals(y)&&s(at).equals(n)&&s(al).equals(n)){   
                query="select * from artdb where art_price<'"+mx+"'";
    }else
            if(i(mn).equals(n)&&i(mx).equals(y)&&s(at).equals(n)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0' and art_price<'"+mx+"'";
    }else
            if(i(mn).equals(n)&&i(mx).equals(y)&&s(at).equals(y)&&s(al).equals(n)){
                query="select * from artdb where art_type='"+at+"' and art_price<'"+mx+"'";
    }else
            if(i(mn).equals(n)&&i(mx).equals(y)&&s(at).equals(y)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0' and art_type='"+at+"' and art_price<'"+mx+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(n)&&s(at).equals(n)&&s(al).equals(n)){
                query="select * from artdb where art_price>'"+mn+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(n)&&s(at).equals(n)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0' and art_price>'"+mn+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(n)&&s(at).equals(y)&&s(al).equals(n)){
                query="select * from artdb where art_type='"+at+"' and art_price>'"+mn+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(n)&&s(at).equals(y)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0' and art_type='"+at+"' and art_price>'"+mn+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(y)&&s(at).equals(n)&&s(al).equals(n)){
                query="select * from artdb where art_price>'"+mn+"' and art_price<'"+mx+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(y)&&s(at).equals(n)&&s(al).equals(y)){
                query="select * from artdb where sold_status='0' and art_price>'"+mn+"' and art_price<'"+mx+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(y)&&s(at).equals(y)&&s(al).equals(n)){
                query="select * from artdb where art_type='"+at+"' and art_price>'"+mn+"' and art_price<'"+mx+"'";
    }else
            if(i(mn).equals(y)&&i(mx).equals(y)&&s(at).equals(y)&&s(al).equals(y)){
            query="select * from artdb where sold_status='0' art_type='"+at+"' and art_price>'"+mn+"' and art_price<'"+mx+"'";
    }else{
            query="select * from artdb";
            }
        return query;
    }
  
}
