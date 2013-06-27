package cn.coolinc.support.web.easyui;

import java.util.List;
import java.util.Map;

/**
 * EasyUI树节点辅助类
 * @author coolinc
 *
 */
public class TreeNode {
    
    /**
     * 根节点ID
     */
    public final static int TREE_ROOT=0;
    
    public int id;
   
    public String text;
    
    public String state;
    
    public boolean checked;
    
    public Map<String,Object> attributes;
    
    public List<TreeNode> children;
    
    //extend
    public int pid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public List<TreeNode> getChildren() {
        return children;
    }

    public void setChildren(List<TreeNode> children) {
        this.children = children;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
    
}
