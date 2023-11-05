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

@Service("TimuService")
public class TimuServiceImpl implements TimuService {

    @Resource
    private TimuMapper dao;

    /**
     * 获取所有数据
     * @return
     */
    public List<Timu> select() {
        return dao.select(null);
    }

    /**
     * 根据Timu类搜索数据
     * @param y
     * @return
     */
    public List<Timu> select(Timu y) {
        return dao.select(y);
    }

    /**
     * 根据主键获取题目一行数据
     * @param id
     * @return
     */
    public Timu find(Object id) {
        return dao.selectByPrimaryKey(id);
    }

    /**
     * 根据题目获取题目类条件查询一行数据
     * @param id
     * @return
     */
    public Timu findEntity(Timu id) {
        return dao.selectOne(id);
    }

    /**
     * 搜索分页
     * @param obj
     * @param page
     * @param pageSize
     * @return
     */
    public List<Timu> selectPage(Timu obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Timu> list = select(obj);
        PageInfo<Timu> pageInfo = new PageInfo(list);
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
    public List<Timu> selectPageExample(Example obj, int page, int pageSize) {
        PageHelper.startPage(page, pageSize, true);
        List<Timu> list = dao.selectByExample(obj);
        PageInfo<Timu> pageInfo = new PageInfo(list);
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
     * 插入题目     * @param y
     * @return
     */
    public int insert(Timu y) {
        return dao.insertSelective(y);
    }

    /**
     * 更新题目     * @param y
     * @return
     */
    public int update(Timu y) {
        return dao.updateByPrimaryKeySelective(y);
    }
}
