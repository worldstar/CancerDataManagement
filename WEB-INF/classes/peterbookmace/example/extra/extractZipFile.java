package peterbookmace.example.extra;
import java.io.*;
import java.util.zip.*;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

//http://www.roseindia.net/tutorial/java/corejava/zip/extract.html
//http://www.java-tips.org/java-se-tips/java.util.zip/how-to-extract-file-files-from-a-zip-file-3.html

public class extractZipFile {
  String fileName = "", message = "";

  public extractZipFile() {
  }

  public extractZipFile(String fileName) {
    this.fileName = fileName;
    if( fileName == null ){
        System.out.println( "Specify the file name please.");
        System.exit(1);
    }
  }
  
    public String getZipFiles(String filename, String path){
		String fileNames = "";
        try
        {
            byte[] buf = new byte[1024];
            ZipInputStream zipinputstream = null;
            ZipEntry zipentry;
            zipinputstream = new ZipInputStream(new FileInputStream(filename));

            System.out.println(path);
            System.out.println(filename);

            zipentry = zipinputstream.getNextEntry();
            while (zipentry != null)
            {
                //for each entry to be extracted
                String entryName = zipentry.getName();
                //System.out.println("entryname "+entryName);
				fileNames += entryName +",";
                int n;
                FileOutputStream fileoutputstream;
                File newFile = new File(path+entryName);//entryName
                String directory = newFile.getParent();

                if(directory == null)
                {
                    if(newFile.isDirectory())
                        break;
                }

                fileoutputstream = new FileOutputStream(newFile);//path+entryName
                System.out.println("path+entryName "+path+entryName);
                
                while ((n = zipinputstream.read(buf, 0, 1024)) > -1)
                    fileoutputstream.write(buf, 0, n);

                fileoutputstream.close();
                zipinputstream.closeEntry();
                zipentry = zipinputstream.getNextEntry();

            }//while
			
            zipinputstream.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
		return fileNames;
    }

  public boolean deleteFile(String fileName){
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

}