package com.app.utils;

import java.util.Calendar;
import java.text.SimpleDateFormat;

public class Fecha {  
    private static Calendar calendar;
    private static String fecha;

    public Fecha() {
       calendar = Calendar.getInstance();
    }

    public static String Fecha() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        fecha = sdf.format(calendar.getTime());
        return fecha;
    }

    public static String FechaBD() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        fecha = sdf.format(calendar.getTime());
        return fecha;
    }
    public static String Hora() {
        calendar = Calendar.getInstance(); 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        fecha = sdf.format(calendar.getTime());
        return fecha;
    }
    public static String Año() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        fecha = sdf.format(calendar.getTime());
        return fecha;
    }
    
    public static void main(String[] args) {
        System.out.println(Hora());
    }
    
   

}
