package com.spring.service;

import com.spring.entity.Gonggao;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface GonggaoService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Gonggao> select();

    /**
     * 根据Gonggao类搜索数据
     * @param y
     * @return
     */
    public List<Gonggao> select(Gonggao y);

    /**
     * 根据主键获取公告一行数据
     * @param id
     * @return
     */
    public Gonggao find(Object id);

    /**
     * 根据公告获取公告类条件查询一行数据
     * @param id
     * @return
     */
    public Gonggao findEntity(Gonggao id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Gonggao> selectPage(Gonggao obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Gonggao> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入公告     * @param y
     * @return
     */
    public int insert(Gonggao y);

    /**
     * 更新公告     * @param y
     * @return
     */
    public int update(Gonggao y);
}
