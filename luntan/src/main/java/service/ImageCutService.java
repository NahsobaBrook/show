package service;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;


/**
 * 
 * @功能：此类用于剪裁图片
 * @作者：李瑞豪
 * @时间：2017年7月21日
 * @地点：31班教室
 */
public class ImageCutService {

	public Map<String, Object> cutImage(String inImageFile, String outImageFile, int x, int y, int width, int height,
            String imageFormat) throws IOException {

        final Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", true);

        // 读取源图像文件
        FileInputStream fileIS = new FileInputStream(inImageFile);
        BufferedImage bufImg = ImageIO.read(new File(inImageFile));


        Iterator<ImageReader> iterator = ImageIO.getImageReadersByFormatName(imageFormat);
        ImageReader reader = iterator.next();

        // 获取图片流
        ImageInputStream imageIS = ImageIO.createImageInputStream(fileIS);
        reader.setInput(imageIS, true);
        ImageReadParam param = reader.getDefaultReadParam();

        // 定义一个矩形
        Rectangle rect = new Rectangle(x, y, width, height);

        // 提供一个 BufferedImage，将其用作解码像素数据的目标。
        param.setSourceRegion(rect);
        bufImg = reader.read(0, param);

        // 保存新图片
        ImageIO.write(bufImg, imageFormat, new File(outImageFile));

        fileIS.close();
        return result;

    }
}
