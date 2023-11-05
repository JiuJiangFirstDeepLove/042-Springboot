package com.spring.service;

import com.spring.entity.Fenlei;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface FenleiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Fenlei> select();

    /**
     * 根据Fenlei类搜索数据
     * @param y
     * @return
     */
    public List<Fenlei> select(Fenlei y);

    /**
     * 根据主键获取分类一行数据
     * @param id
     * @return
     */
    public Fenlei find(Object id);

    /**
     * 根据分类获取分类类条件查询一行数据
     * @param id
     * @return
     */
    public Fenlei findEntity(Fenlei id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Fenlei> selectPage(Fenlei obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Fenlei> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入分类     * @param y
     * @return
     */
    public int insert(Fenlei y);

    /**
     * 更新分类     * @param y
     * @return
     */
    public int update(Fenlei y);
}
