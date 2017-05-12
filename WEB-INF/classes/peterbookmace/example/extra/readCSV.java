package peterbookmace.example.extra;
import java.io.*;

public class readCSV {
  public readCSV() {
  }

  public readCSV(String fileName) {
    this.fileName = fileName;
    if( fileName == null ){
        System.out.println( "Specify the file name please.");
        System.exit(1);
    }
  }

  String fileName = "", message = "";

  public void setData(String fileName){

  }

  public boolean testReadData(){
    boolean canreadFile = false;
    try
    {
        File file = new File( fileName );
        canreadFile = file.canRead();
        //System.out.println(fileName+" "+canreadFile);
      }   //end try
      catch( Exception e )
      {
          e.printStackTrace();
          System.out.println(e.toString());
          System.exit(0);
      }   // end catch
      return canreadFile;
  }

  public boolean checkUTF8Encoding(){
    boolean isUTF8 = false;
    try
    {
        File file = new File( fileName );
        InputStreamReader r = new InputStreamReader(new FileInputStream(file));
        System.out.println(r.getEncoding());
        
        if(r.getEncoding().equals("UTF-8")){
            isUTF8 = true;
        }

        r.close();
    }   //end try
    catch( Exception e )
    {
        e.printStackTrace();
        System.out.println(e.toString());
    }
    System.out.println( "isUTF8" + isUTF8 );
      return isUTF8;
  }

  public String getDataFromFile(){
      checkUTF8Encoding();
      
      System.out.println(fileName);
    try
    {		
        File file = new File( fileName );
        FileInputStream fis = new FileInputStream( file );
        DataInputStream in = new DataInputStream(fis);
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8" ));
        String eachLine = "";

        while ((eachLine = br.readLine()) != null)   {
          message += eachLine +"<BR>";
        }
        br.close();
        in.close();
        fis.close();
    }   //end try
    catch( Exception e )
    {
        e.printStackTrace();
        System.out.println(e.toString());
    }	
    //System.out.println( "done" );
      return message;
  }

  public boolean deleteFile(){
    boolean canDelete = false;
    try
    {
        File file = new File( fileName );
        canDelete = file.delete();
        //System.out.println(fileName+" "+canreadFile);
      }   //end try
      catch( Exception e )
      {
          e.printStackTrace();
          System.out.println(e.toString());
          System.exit(0);
      }   // end catch
      return canDelete;
  }

  public String getMessage(){
    return message;
  }

}