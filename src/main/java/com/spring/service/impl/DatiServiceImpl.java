package com.spring.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.*;
import com.spring.entity.*;
import com.spring.service.*;
import com.spring.util.*;
import java.util.*;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

@Service("DatiService")
public class DatiServiceImpl implements DatiService {

    @Resource
    private DatiMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Dati> select() {
        return dao.select(null);
    }

    /**
     * 根据Dati类搜索数据
     * @param y
     * @return
     */
    public List<Dati> select(Dati y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取答题一行数据
     * @param id
     * @return
     */
    public Dati find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据答题获取答题类条件查询一行数据
     * @param id
     * @return
     */
    public Dati findEntity(Dati id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Dati> selectPage(Dati obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Dati> list = select(obj);
        PageInfo<Dati> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据Example搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Dati> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Dati> list = dao.selectByExample(obj);
        PageInfo<Dati> pageInfo = new PageInfo(list);
        PageInfoUtil pageInfoUtil = new PageInfoUtil(page);
        pageInfoUtil.setPageInfo(Request.getRequest(), pageInfo.getTotal(), pageSize);
        return list;
    }

    /**
     * 根据主键删除一行数据
     * @param id
     * @return
     */
    public int delete(Object id) {
        return dao.deleteByPrimaryKey(id);
    }

    /**
     * 插入答题     * @param y
     * @return
     */
    public int insert(Dati y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新答题     * @param y
     * @return
     */
    public int update(Dati y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
