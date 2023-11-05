package com.spring.service;

import com.spring.entity.Shenhe;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface ShenheService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Shenhe> select();

    /**
     * 根据Shenhe类搜索数据
     * @param y
     * @return
     */
    public List<Shenhe> select(Shenhe y);

    /**
     * 根据主键获取审核一行数据
     * @param id
     * @return
     */
    public Shenhe find(Object id);

    /**
     * 根据审核获取审核类条件查询一行数据
     * @param id
     * @return
     */
    public Shenhe findEntity(Shenhe id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Shenhe> selectPage(Shenhe obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Shenhe> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入审核     * @param y
     * @return
     */
    public int insert(Shenhe y);

    /**
     * 更新审核     * @param y
     * @return
     */
    public int update(Shenhe y);
}
