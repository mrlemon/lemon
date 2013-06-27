package cn.coolinc.support.dao;

import java.io.Serializable;

/**
 * 分页辅助类
 * @author coolinc
 *
 */
public class Page implements Serializable {
    private static final long serialVersionUID = 8280485938848398236L;
    public final static int DAFAULT_SIZE=10;
    private final int page;
    private final int size;
    private int total;
    private int pageCount;
    
    //extend for view
    public int rows;

    public Page(int page, int size) {
        if (1 > page)
            throw new IllegalArgumentException("Page index must not be less than one!");
        if (0 >= size) {
            throw new IllegalArgumentException("Page size must not be less than or equal to zero!");
        } else {
            this.page = page;
            this.size = size;
            return;
        }
    }

    public int getPageSize() {
        return size;
    }

    public int getPageNumber() {
        return page;
    }

    public int getOffset() {
        return (page-1) * size;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
        pageCount = total / size + (total % size == 0 ? 0 : 1);
        if (total == 0) {
            if (page != 1)
                throw new IndexOutOfBoundsException("Page index out of range.");
        } else {
            if (page > pageCount)
                throw new IndexOutOfBoundsException("Page index out of range.");
        }
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }
}
