package cn.coolinc.support.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

/**
 * Jackson自定义格式序列化
 * 序列化格式为：yyyy-MM-dd
 * @see cn.coolinc.support.web.CustomDateTimeSerializer
 * @author coolinc
 */
public class CustomDateSerializer  extends JsonSerializer<Date>{
	@Override
    public void serialize(Date value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonProcessingException {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = formatter.format(value);
            jgen.writeString(formattedDate);
    }
}
