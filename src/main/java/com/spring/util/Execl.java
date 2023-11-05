package com.spring.util;

import com.spring.config.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.*;
import jxl.write.Label;
import jxl.write.WritableImage;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
 * Execl 导出或者导入
 */
public class Execl {

    static final int CELL_STRING = 0;
    static final int CELL_IMAGE = 1;
    static final int CELL_NUMBER = 2;
    static final int CELL_SELECT = 3;

    // 表头
    protected Map<String, Map<String, Object>> th = null;
    //列表
    protected List<Map<String, Object>> list = null;
    // 某表的数据行
    protected Map<String, Map> tables;
    // 列字段
    protected List<String> columnField = null;

    /**
     * 初始化
     */
    public Execl() {
        th = new LinkedHashMap();
        columnField = new ArrayList();
        list = new ArrayList();
        tables = new LinkedHashMap();
    }

    /**
     * 获取某表的数据
     * @param name
     * @return
     */
    public Map getTable(String name) {
        return tables.get(name) != null ? tables.get(name) : new LinkedHashMap();
    }

    /**
     * 添加一个表头字段信息
     * @param field 数据中的字段名
     * @param name  显示的名称
     */
    public void addCol(String field, String name) {
        addCol(field, name, 25, CELL_STRING);
    }

    /**
     * 添加一个表头字段为下拉框
     * @param field 数据中的字段名
     * @param name  显示的名称
     * @param table 是哪个表的
     * @param value 下拉框中的值
     * @param text  显示的名称
     * @param mul   是否为多选
     */
    public void addColSelect(String field, String name, String table, String value, String text, int mul) {
        Map col = addCol(field, name, 25, CELL_SELECT);
        Map selectCell = Query.make(table).field(value).field(text).getColkey(text, value);

        tables.put(field, selectCell);
        col.put("table", selectCell);
        col.put("mul", mul);
    }

    // 下拉框
    /**
     * 添加一个表头字段为下拉框
     * @param field 数据中的字段名
     * @param name  显示的名称
     * @param textarea 一行代表一个数据
     * @param mul   是否为多选
     */
    public void addColSelect(String field, String name, String textarea, int mul) {
        String[] sel = textarea.split("\\r?\\n");
        Map<String, String> selectCell = new LinkedHashMap();
        for (int i = 0; i < sel.length; i++) {
            if (sel[i].indexOf("=") >= 0) {
                String[] ls = sel[i].split("=");
                String text = ls[0];
                String key = ls[1];
                selectCell.put(key, text);
            } else {
                selectCell.put(sel[i], sel[i]);
            }
            //selectCell.put("");
        }

        Map col = addCol(field, name, 25, CELL_SELECT);
        //Map selectCell = Query.make(table).field(value).field(text).getColkey(text , value);

        tables.put(field, selectCell);
        col.put("table", selectCell);
        col.put("mul", mul);
    }

    /**
     * 添加一列
     * @param field  数据中的字段名
     * @param name   显示的名称
     * @param width  宽度
     * @param cell_type   类型 为： Execl.CELL_ 开头的值
     * @return
     */
    public Map addCol(String field, String name, int width, int cell_type) {
        Map col = new LinkedHashMap();
        col.put("name", name);
        col.put("width", width);
        col.put("type", Integer.valueOf(cell_type));
        th.put(field, col);
        columnField.add(field);
        return col;
    }

    /**
     * 添加一行数据
     * @param data
     */

    public void addData(Map data) {
        list.add(data);
    }

    /**
     * 添加一个数据集
     * @param data
     */
    public void addData(List data) {
        list.addAll(data);
    }

    /**
     * 导出，并输出到浏览器
     * @param name
     * @param response
     */
    public void export(String name, HttpServletResponse response) {
        try {
            ServletOutputStream writer = response.getOutputStream();
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=" + name + ".xls");
            export(writer);
            writer.close();
        } catch (Exception e) {}
    }

    /**
     * 复制一行数据
     * @param s
     * @return
     */
    public Map dictionary(Map s) {
        Map<String, String> result = new LinkedHashMap();
        Map<String, String> form = s;
        Set<String> keys = form.keySet();
        for (String key : keys) {
            String value = form.get(key);
            result.put(value, key);
        }
        return result;
    }

    /**
     * 根据文件导入数据 并返回相应的数据集
     * @param file
     * @param request
     * @return
     */
    public List imports(String file, HttpServletRequest request) {
        String path = Configure.ROOT_DIR + file;
        return imports(new File(path));
    }

    /**
     * 根据文件导入数据 并返回相应的数据集
     * @param file
     * @return
     */
    public List imports(File file) {
        Workbook wwb = null;
        List<Map> result = new ArrayList();
        try {
            WorkbookSettings settings = new WorkbookSettings();
            settings.setLocale(Locale.SIMPLIFIED_CHINESE);
            //HttpServletRequest request = Request.getRequest();
            //String path = request.getSession().getServletContext().getRealPath("/")+file;
            wwb = Workbook.getWorkbook(file);
            Sheet ws = wwb.getSheet(0);

            int columns = ws.getColumns();
            int rows = ws.getRows();
            int fieldSize = columnField.size();
            Map nTables = new LinkedHashMap();
            String x = ws.getCell(0, 0).getContents();
            int colStart = 0;
            if (x.indexOf("序号") != -1) {
                colStart = 1;
            }
            fieldSize += colStart;
            for (int row = 1; row < rows; row++) {
                Map map = new LinkedHashMap();
                boolean isInsert = true;
                for (int col = colStart; col < columns && col < fieldSize; col++) {
                    String field = columnField.get(col - colStart);
                    Cell cell = ws.getCell(col, row);
                    String content = cell.getContents();
                    if (col - colStart == 0) {
                        if (content.trim().equals("")) {
                            isInsert = false;
                            break;
                        }
                    }
                    Map<String, Object> head = th.get(field);
                    int type = ((Integer) head.get("type")).intValue();
                    if (type == CELL_SELECT) {
                        // 等于选择类型
                        if (!nTables.containsKey(field)) {
                            // 没有
                            nTables.put(field, dictionary((Map) head.get("table")));
                        }
                        Map<String, String> tb = (Map) nTables.get(field);

                        map.put(field, tb.get(content) == null ? "" : tb.get(content));
                        field += "_text";
                    }
                    map.put(field, content);
                }
                if (isInsert) {
                    result.add(map);
                }
            }
            wwb.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 导出数据到写出流中
     * @param  writer
     */
    public void export(OutputStream writer) {
        WritableWorkbook wwb = null;
        try {
            //ServletOutputStream writer = response.getOutputStream();
            //response.setContentType("application/vnd.ms-excel");
            //response.addHeader("Content-Disposition", "attachment;filename="+name+".xls");

            WorkbookSettings settings = new WorkbookSettings();
            settings.setLocale(Locale.SIMPLIFIED_CHINESE);

            // 直接写输出流，不需要写到文件中，避免生成文件
            wwb = Workbook.createWorkbook(writer, settings);
            //Workbook的createSheet方法有两个参数，第一个是工作表的名称，第二个是工作表在工作薄中的位置
            WritableSheet ws = wwb.createSheet("sheet1", 0);
            int i = 0;
            ws.setRowView(0, 100 * 4);
            for (Map.Entry<String, Map<String, Object>> entry : th.entrySet()) {
                //CellView cellView = new CellView();
                Map<String, Object> value = entry.getValue();
                ws.setColumnView(i, ((Integer) value.get("width")).intValue());

                Label label = new Label(i, 0, value.get("name").toString());
                // 设置表头
                ws.addCell(label);
                i++;
                //System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
            }

            int row = 1;
            // 设置数据行
            for (Map<String, Object> map : list) {
                int col = 0;
                ws.setRowView(row, 100 * 4);
                for (Map.Entry<String, Map<String, Object>> entry : th.entrySet()) {
                    String field = entry.getKey();
                    int type = ((Integer) entry.getValue().get("type")).intValue();
                    String value = map.get(field).toString();
                    if (type == CELL_STRING) {
                        Label label = new Label(col, row, value);
                        ws.addCell(label);
                    } else if (type == CELL_IMAGE) {
                        String path = Thread.currentThread().getContextClassLoader().getResource("").toURI().getPath();
                        WritableImage image = new WritableImage(row, col, 5.0D, 7.0D, new File(path + value));
                        ws.addImage(image);
                    } else if (type == CELL_NUMBER) {
                        jxl.write.Number number = new jxl.write.Number(col, row, Double.valueOf(value));
                        ws.addCell(number);
                    } else if (type == CELL_SELECT) {
                        Map<String, String> table = (Map) entry.getValue().get("table");
                        String v = table.get(value);
                        Label label = new Label(col, row, v);
                        ws.addCell(label);
                    }
                    col++;
                }
                row++;
            }
            wwb.write();
            wwb.close();
            writer.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
