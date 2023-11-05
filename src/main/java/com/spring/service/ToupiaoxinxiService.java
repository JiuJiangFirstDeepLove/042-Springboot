package com.spring.service;

import com.spring.entity.Toupiaoxinxi;
import java.util.*;
import tk.mybatis.mapper.entity.Example;

public interface ToupiaoxinxiService {
    /**
     * 获取所有数据
     * @return
     */
    public List<Toupiaoxinxi> select();

    /**
     * 根据Toupiaoxinxi类搜索数据
     * @param y
     * @return
     */
    public List<Toupiaoxinxi> select(Toupiaoxinxi y);

    /**
     * 根据主键获取投票信息一行数据
     * @param id
     * @return
     */
    public Toupiaoxinxi find(Object id);

    /**
     * 根据投票信息获取投票信息类条件查询一行数据
     * @param id
     * @return
     */
    public Toupiaoxinxi findEntity(Toupiaoxinxi id);

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Toupiaoxinxi> selectPage(Toupiaoxinxi obj, int page, int pageSize);

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Toupiaoxinxi> selectPageExample(Example obj, int page, int pageSize);

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id);

    /**
     * 插入投票信息     * @param y
     * @return
     */
    public int insert(Toupiaoxinxi y);

    /**
     * 更新投票信息     * @param y
     * @return
     */
    public int update(Toupiaoxinxi y);
}
