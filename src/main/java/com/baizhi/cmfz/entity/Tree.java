package com.baizhi.cmfz.entity;

import java.io.Serializable;
import java.util.List;

public class Tree implements Serializable{
    /*id：节点ID，对加载远程数据很重要。
    text：显示节点文本。
    state：节点状态，'open' 或 'closed'，默认：'open'。如果为'closed'的时候，将不自动展开该节点。
    checked：表示该节点是否被选中。
    attributes: 被添加到节点的自定义属性。
    children: 一个节点数组声明了若干节点。*/
    private int id;
    private String text;
    private String state="open";
    private boolean checked=false;
    private String attributes;
    private String resurl;
    private List<Tree> children;

    @Override
    public String toString() {
        return "Tree{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", state='" + state + '\'' +
                ", checked=" + checked +
                ", attributes='" + attributes + '\'' +
                ", resurl='" + resurl + '\'' +
                ", children=" + children +
                '}';
    }

    public Tree() {
    }

    public Tree(int id, String text, String state, boolean checked, String attributes, String resurl, List<Tree> children) {
        this.id = id;
        this.text = text;
        this.state = state;
        this.checked = checked;
        this.attributes = attributes;
        this.resurl = resurl;
        this.children = children;
    }

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

    public String getAttributes() {
        return attributes;
    }

    public void setAttributes(String attributes) {
        this.attributes = attributes;
    }

    public String getResurl() {
        return resurl;
    }

    public void setResurl(String resurl) {
        this.resurl = resurl;
    }

    public List<Tree> getChildren() {
        return children;
    }

    public void setChildren(List<Tree> children) {
        this.children = children;
    }
}
