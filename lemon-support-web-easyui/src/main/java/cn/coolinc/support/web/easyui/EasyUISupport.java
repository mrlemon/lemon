package cn.coolinc.support.web.easyui;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * EasyUI辅助工具类
 * @author coolinc
 *
 */
public class EasyUISupport {
    
    String contextPath;
    
    public String getContextPath() {
        return contextPath;
    }

    public void setContextPath(String contextPath) {
        this.contextPath = contextPath;
    }

    /**
     * 返回EasyUI菜单
     * @param nodeList
     * @param contextPath
     * @return
     */
    public static String getEasyUIMenu(List<Menu> srcList,List<Menu> distList,String contextPath){
        wrapMenuParent(srcList, distList);
        StringBuffer rootMenu=new StringBuffer();
        StringBuffer subMenu=new StringBuffer();
        TreeNode node = buildEasyUITreeNode(distList);
        List<TreeNode> children = node.getChildren();
        for(TreeNode n:children){
            if(n.getChildren()==null||n.getChildren().size()==0){
                rootMenu.append("<a class=\"easyui-linkbutton\" data-options=\"plain:true\"");
                if(n.getAttributes().get("url")!=null){
                    rootMenu.append(" onclick=\"javascript:addTab('")
                    .append(n.getText())
                    .append("','")
                    .append(contextPath)
                    .append(n.getAttributes().get("url"))
                    .append("');\"");
                }
                rootMenu.append(">");
                rootMenu.append(n.getText()).append("</a>\n");
            }else{
                rootMenu.append("<a class=\"easyui-menubutton\" data-options=\"menu:'#mm").append(n.getId()).append("'\">").append(n.getText()).append("</a>\n");
                subMenu.append("<div").append(" id=\"mm").append(n.getId()).append("\">\n");
                buildEasyUISubMenu(n,subMenu,contextPath);
                subMenu.append("</div>");
            }
        }
        rootMenu.append(subMenu);
        return rootMenu.toString();
    }
    
    /**
     * 辅助函数：补足父节点
     * @param srcList
     * @param distList
     */
    private static void wrapMenuParent(List<Menu> srcList,List<Menu> distList){
        Set<Integer> pidSet=new HashSet<Integer>();
        Set<Integer>  additionalPidSet=new HashSet<Integer>();
        Set<Integer> idSet=new HashSet<Integer>();
        for(Menu menu:distList){
            pidSet.add(menu.getPid());
            idSet.add(menu.getId());
        }
        for(int pid:pidSet){
            if(idSet.contains(pid))
                continue;
            additionalPidSet.add(pid);
        }
        
        for(int pid:additionalPidSet){
            for(Menu menu:srcList){
                if(pid==menu.getId()){
                    distList.add(menu);
                }
            }
        }
        java.util.Collections.sort(distList);
    }
    
    /**
     * 辅助函数：返回子菜单
     * @param node
     * @param subMenu
     * @return
     */
    public static StringBuffer buildEasyUISubMenu(TreeNode node,StringBuffer subMenu,String contextPath){
        List<TreeNode> children = node.getChildren();
        for(TreeNode n:children){
            if(n.getChildren()==null||n.getChildren().size()==0){
                subMenu.append("<div")
                       .append(" onclick=\"javascript:L.add_tab('")
                       .append(n.getText())
                       .append("','")
                       .append(contextPath)
                       .append(n.getAttributes().get("url"))
                       .append("');\"")
                       .append(">")
                       .append(n.getText()).append("</div>\n");
            }else{
                subMenu.append("<div>\n<span>").append(n.getText()).append("</span>\n<div>\n");
                buildEasyUISubMenu(n,subMenu,contextPath);
                subMenu.append("</div>\n</div>\n");
            }
        }
        return subMenu;
    }
    
	
    /**
     * 返回EasyUI树形结构数据
     * @param nodeList
     * @return
     */
    public static List<TreeNode> getEasyUITree(List<? extends TreeNodeSupport> nodeList){
        List<TreeNode> result=new ArrayList<TreeNode>();
        result.add(buildEasyUITreeNode(nodeList));
        return result;
    }
    
    /**
     * 辅助函数：处理树形结构数据
     * @param nodeList
     * @return
     */
    private static TreeNode buildEasyUITreeNode(List<? extends TreeNodeSupport> nodeList){
        TreeNode root=new TreeNode();
        root.setId(TreeNode.TREE_ROOT);
        buildEasyUITree(root,nodeList);
        return root;
    }
    
    /**
     * 辅助函数：处理树形结构数据
     * @param node
     * @param nodeList
     */
    private static void buildEasyUITree(TreeNode node,List<? extends TreeNodeSupport> nodeList){
        List<TreeNode> children=new ArrayList<TreeNode>();
        for(TreeNodeSupport ns:nodeList){
            TreeNode e = ns.getEasyUITreeNode();
            if(node.getId()==e.getPid()){
                children.add(e);
                buildEasyUITree(e,nodeList);
            }
        }
        node.setChildren(children);
    }
    
//    
//    public static void main(String[] args) {
//        Menu n1=new Menu();
//        Menu n2=new Menu();
//        Menu n3=new Menu();
//        Menu n4=new Menu();
//        Menu n5=new Menu();
//        Menu n6=new Menu();
//        n1.setId(1);
//        n1.setName("菜单一");
//        n1.setPid(0);
//        
//        n2.setId(2);
//        n2.setName("菜单二");
//        n2.setPid(0);
//        
//        n3.setId(3);
//        n3.setName("菜单1-1");
//        n3.setPid(1);
//        
//        n4.setId(4);
//        n4.setName("菜单1-1-1");
//        n4.setPid(3);
//        
//        n5.setId(5);
//        n5.setName("菜单1-2");
//        n5.setPid(1);
//        
//        n6.setId(6);
//        n6.setName("菜单1-1-1-1");
//        n6.setPid(4);
//        
//        List<EasyUITreeNodeSupport> nodeList=new ArrayList<EasyUITreeNodeSupport>();
//        nodeList.add(n1);
//        nodeList.add(n2);
//        nodeList.add(n3);
//        nodeList.add(n4);
//        nodeList.add(n5);
//        nodeList.add(n6);
//        System.out.println( getEasyUIMenu(nodeList));
//    }
}
