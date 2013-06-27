package cn.coolinc.util.log;

import org.apache.log4j.HTMLLayout;

public class MailLoger4jHTMLLayout extends HTMLLayout {

    @Override
    public String getContentType() {
        return "text/html;charset=utf-8"; 
    }
}
