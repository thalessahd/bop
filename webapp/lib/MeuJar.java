package meujar;

/**
 *
 * @author Thalessa
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MeuJar {
    
    public static String pegaGit(String user, String palavra){
        String linha;
        String jsonString="";
        char[] c = new char[100];
        String resp="";
	   
      try{
          InputStream is = new URL("https://api.github.com/search/code?q="+palavra+"+user:"+user).openStream();
          BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
          
          while( (linha= rd.readLine()) != null){
              jsonString += linha;
          }
      }catch (MalformedURLException ex) {
		Logger.getLogger(MeuJar.class.getName()).log(Level.SEVERE, null, ex);
      }catch (IOException ex) {
		Logger.getLogger(MeuJar.class.getName()).log(Level.SEVERE, null, ex);
      } 
      
        jsonString.getChars(2,18,c,0);
		for(char c1 : c)
                    resp += c1;
                    //System.out.print(c1);
        return resp;
    }
}
