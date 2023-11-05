package com.spring.service;

import com.spring.entity.Toupiao;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface ToupiaoService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Toupiao> select();

    /**
     * 根据Toupiao类搜索数据
     * @param y
     * @return
     */
    public List<Toupiao> select(Toupiao y);

    /**
     * 根据主键获取投票一行数据
     * @param id
     * @return
     */
    public Toupiao find(Object id);

    /**
     * 根据投票获取投票类条件查询一行数据
     * @param id
     * @return
     */
    public Toupiao findEntity(Toupiao id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Toupiao> selectPage(Toupiao obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Toupiao> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入投票     * @param y
     * @return
     */
    public int insert(Toupiao y);

    /**
     * 更新投票     * @param y
     * @return
     */
    public int update(Toupiao y);
}
