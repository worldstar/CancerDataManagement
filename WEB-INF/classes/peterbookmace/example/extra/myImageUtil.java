package peterbookmace.example.extra;
import java.io.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.*;
import java.net.*;
import java.io.IOException;

public class myImageUtil extends Thread{
  public myImageUtil() {
  }

  public void resizeImage(String figURL, String nameAndPath){
       try {
           figURL = java.net.URLEncoder.encode(new String(figURL.getBytes()), "UTF-8");
            System.out.println("figURL "+URLDecoder.decode(figURL, "UTF-8"));
            BufferedImage loadImg = ImageIO.read(new URL(URLDecoder.decode(figURL, "UTF-8")));//http://localhost:8080/            
            int w = loadImg.getWidth();
            int h = loadImg.getHeight();
            double maxLogoSize = 175.0;
            double scaleRatio = 1.0;
            boolean isChangeLogoSize = false;
            //OutputStream os = response.getOutputStream();
            //System.out.println("w h "+w+" "+h);

            if(w > maxLogoSize && w >= h){
                scaleRatio = maxLogoSize/w;
                isChangeLogoSize = true;
            }
            else if(h > maxLogoSize && h >= w){
                scaleRatio = maxLogoSize/h;
                isChangeLogoSize = true;
            }

            if(isChangeLogoSize){
                int newW = (int)(w*scaleRatio);
                int newH = (int)(h*scaleRatio);
                BufferedImage dimg = new BufferedImage(newW, newH, loadImg.getType());
                Graphics2D g2 = (Graphics2D)dimg.getGraphics();
                g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
                g2.drawImage(loadImg, 0, 0, newW, newH, 0, 0, w, h, null);
                g2.dispose();
                //String nameAndPath = config.getServletContext().getRealPath(Logo);
                //System.out.println("nameAndPath"+nameAndPath);
                ImageIO.write(dimg, "jpg" ,new File(nameAndPath));
            }
      } catch (IOException e) {
           e.printStackTrace();
      }
  }

  public void attachImageBasic(String figCaimaURL, String blankFigURL, String figURL, String nameAndPath, String companyName, int showLogo){
       try {
           figURL = java.net.URLEncoder.encode(new String(figURL.getBytes()), "UTF-8");
            BufferedImage loadImg = ImageIO.read(new URL(figCaimaURL));//Caima
            BufferedImage blankImg = ImageIO.read(new URL(blankFigURL));//Blank figure
            
            int w = loadImg.getWidth();
            int h = loadImg.getHeight();

            Graphics2D g = (Graphics2D)loadImg.getGraphics();
            g.drawImage(blankImg, 180, 181, null);
            
            if(showLogo == 1){
                BufferedImage image = ImageIO.read(new URL(URLDecoder.decode(figURL, "UTF-8")));//Logo
                int w2 = image.getWidth();
                int h2 = image.getHeight();
                int positionX = w/2-w2/2-2;
                int positionY = h/2-h2/2;
                g.drawImage(image, positionX, positionY, null);
            }
            else{
                //Put text
                int fontSize = (int)(180)/companyName.length();
                int offsetX = w/2-(180)/2;

                if(offsetX < 180){
                    offsetX = 180;
                }

                g.setFont(new Font("標楷體", Font.PLAIN, fontSize));
                g.setColor(Color.red);
                g.drawString(companyName, offsetX, h/2);
            }
            g.dispose();	

            ImageIO.write(loadImg, "png" ,new File(nameAndPath));
      } catch (IOException e) {
           e.printStackTrace();
      }
  }

  static String figCaimaURL = "";
  static String blankFigURL = "";
  static String figURL = "";
  static String nameAndPath = "";
  static String companyName = "";
  static int showLogo = 1;
  
  public void attachImage(String figCaimaURL, String blankFigURL, String figURL, String nameAndPath, String companyName, int showLogo){
      this.figCaimaURL = figCaimaURL;
      this.blankFigURL = blankFigURL;
      this.figURL = figURL;
      this.nameAndPath = nameAndPath;
      this.companyName = companyName;
      this.showLogo = showLogo;

      Thread t = new myImageUtil(); // 產生Thread物件
      t.start(); // 開始執行t.run()
  }

    public void run() { // override Thread's run()
        attachImageBasic(figCaimaURL, blankFigURL, figURL, nameAndPath, companyName, showLogo);
    }

}