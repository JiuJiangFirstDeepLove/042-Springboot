package com.spring.service;

import com.spring.entity.Dati;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface DatiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Dati> select();

    /**
     * 根据Dati类搜索数据
     * @param y
     * @return
     */
    public List<Dati> select(Dati y);

    /**
     * 根据主键获取答题一行数据
     * @param id
     * @return
     */
    public Dati find(Object id);

    /**
     * 根据答题获取答题类条件查询一行数据
     * @param id
     * @return
     */
    public Dati findEntity(Dati id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Dati> selectPage(Dati obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Dati> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入答题     * @param y
     * @return
     */
    public int insert(Dati y);

    /**
     * 更新答题     * @param y
     * @return
     */
    public int update(Dati y);
}
