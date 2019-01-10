package meujar;

// @author Thalessa

import java.util.*;
import java.io.*;
import java.net.*;

public class jarTarefa4 {
	public static String pegaFraseGOT() {
		
		try{
			InputStream is = new URL("API FRASES GOT").openStream();
			BufferedReader rd = new BufferedReader(
			new InputStreamReader(is, Charset.forName("UTF-8")));
			
		}catch (Exception ex){
			
		}
		
		return rd.readLine(); //Retorna a frase como String
		
	}
	
	
}