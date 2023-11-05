package com.spring.service;

import com.spring.entity.Timu;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface TimuService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Timu> select();

    /**
     * 根据Timu类搜索数据
     * @param y
     * @return
     */
    public List<Timu> select(Timu y);

    /**
     * 根据主键获取题目一行数据
     * @param id
     * @return
     */
    public Timu find(Object id);

    /**
     * 根据题目获取题目类条件查询一行数据
     * @param id
     * @return
     */
    public Timu findEntity(Timu id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Timu> selectPage(Timu obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Timu> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入题目     * @param y
     * @return
     */
    public int insert(Timu y);

    /**
     * 更新题目     * @param y
     * @return
     */
    public int update(Timu y);
}
