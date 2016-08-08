package platform.util;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
//import com.sun.image.codec.jpeg.JPEGCodec;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.MemoryCacheImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Iterator;
import java.util.List;

//import sun.awt.image.codec.JPEGImageEncoderImpl;

/**
 * @author houwl
 * @date 2015/5/15
 */
public class FileUtil {

    public static void main(String args[]) throws IOException {

      File file=  new File("abc.tif");
        FileInputStream fis = new FileInputStream(file);
        ByteArrayOutputStream bos = new ByteArrayOutputStream(1000);
        byte[] b = new byte[1024];
        int n;
        while ((n = fis.read(b)) != -1) {
            bos.write(b, 0, n);
        }

        tif2Jpeg(bos.toByteArray());
        fis.close();
        bos.close();
    }
    /* tif转换到jpg格式 */
   public static byte[] tif2Jpeg(byte[] binData) throws IOException {

       Iterator iterator = ImageIO.getImageReadersByFormatName("tiff");
       ImageReader reader = (ImageReader) iterator.next();

       ImageInputStream is = new MemoryCacheImageInputStream(new ByteArrayInputStream(binData));
       reader.setInput(is);

       BufferedImage image = reader.read(0);

       //BufferedImage tif = ImageIO.read(new ByteArrayInputStream(binData));
       ByteArrayOutputStream output = new ByteArrayOutputStream();
       ImageIO.write(image, "png", output);

//       JPEGImageEncoderImpl encoder = (JPEGImageEncoderImpl) JPEGCodec.createJPEGEncoder(output);
//       encoder.encode(image);
       return output.toByteArray();
    }
    public static byte[] pdf2Jpg(byte[] binData) throws Exception {
        PDDocument doc = null;

        try {
            doc = PDDocument.load(new ByteArrayInputStream(binData));
            List e2 = doc.getDocumentCatalog().getAllPages();
            if(e2.size() == 1) {
                PDPage var28 = (PDPage)e2.get(0);
                BufferedImage var30 = var28.convertToImage();
                ByteArrayOutputStream var31 = new ByteArrayOutputStream();
                ImageIO.write(var30, "jpg", var31);
//                JPEGImageEncoderImpl encoder = (JPEGImageEncoderImpl) JPEGCodec.createJPEGEncoder(var31);//不依赖与temp目录
//                encoder.encode(var30);
                byte[] var32 = var31.toByteArray();
                var31.close();
                var30.flush();
                var30 = null;
                byte[] var33 = var32;
                return var33;
            } else {
                boolean totalWidth = false;
                boolean totalHeight = false;
                PDPage firstPage = (PDPage)e2.get(0);
                BufferedImage firstImage = firstPage.convertToImage();
                int var27 = firstImage.getWidth();
                int var29 = firstImage.getHeight() * e2.size();
                firstImage.flush();
                firstImage = null;
                BufferedImage imageOut = new BufferedImage(var27, var29, 1);
                Graphics g = imageOut.getGraphics();
                g.setColor(new Color(255, 255, 255));
                byte x = 0;
                int y = 0;

                for(int outputStream = 0; outputStream < e2.size(); ++outputStream) {
                    PDPage imageBinData = (PDPage)e2.get(outputStream);
                    BufferedImage image = imageBinData.convertToImage();
                    int[] e21 = image.getRGB(0, 0, image.getWidth(), image.getHeight(), (int[])null, 0, image.getWidth());
                    imageOut.setRGB(x, y, image.getWidth(), image.getHeight(), e21, 0, image.getWidth());
                    y += image.getHeight();
                    image.flush();
                    image = null;
                }

                ByteArrayOutputStream var34 = new ByteArrayOutputStream();
                ImageIO.write(imageOut, "jpg", var34);
//                JPEGImageEncoderImpl encoder = (JPEGImageEncoderImpl) JPEGCodec.createJPEGEncoder(var34);//不依赖与temp目录
//                encoder.encode(imageOut);
                byte[] var35 = var34.toByteArray();
                var34.close();
                imageOut.flush();
                imageOut = null;
                byte[] var36 = var35;
                return var36;
            }
        } catch (Exception var25) {
            throw new RuntimeException(var25);
        } finally {
            try {
                if(doc != null) {
                    doc.close();
                }
            } catch (Exception var24) {
                throw new RuntimeException(var24);
            }

        }
    }
}
