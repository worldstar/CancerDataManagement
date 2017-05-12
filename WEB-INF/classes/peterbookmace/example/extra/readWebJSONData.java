package peterbookmace.example.extra;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;


//http://www.roseindia.net/tutorial/java/corejava/zip/extract.html
//http://www.java-tips.org/java-se-tips/java.util.zip/how-to-extract-file-files-from-a-zip-file-3.html

public class readWebJSONData {
  String fileName = "", message = "";

  public readWebJSONData() {
  }
  //http://www.vogella.com/articles/ApacheHttpClient/article.html
  public String getData(String queryString){
    HttpClient client = new DefaultHttpClient();
    HttpPost post = new HttpPost(queryString);
    String line = "";

    try {
      HttpResponse response = client.execute(post);
      BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
      String tempLine = "";
      while ((tempLine = rd.readLine()) != null) {
        //System.out.println(tempLine);
        line += tempLine;
      }

    } catch (IOException e) {
      e.printStackTrace();
    }
    return line;
  }
}