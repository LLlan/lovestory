package com.yizhan.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class FormateUtil {

    private static final NumberFormat NUMBER_AS_INT_STRING = new DecimalFormat("##");
    public static final NumberFormat MONEY_FORMATE_LONG = new DecimalFormat("##0");
    private static final NumberFormat NUMBER_AS_INT_AND_POINT_STRING = new DecimalFormat("##.00");
    public static final NumberFormat MONEY_FORMATE = new DecimalFormat("##0.00");
    
    /**
     * 45435.90-->45436
     * 43.45-->43
     * @param value
     * @return
     */
    public static String formateDoubleAsIntString(double value) {
        return NUMBER_AS_INT_STRING.format(value);
    }

    /**
     * 45435.90-->45436
     * 43.45-->43
     * @param value
     * @return
     */
    public static String formateLongAsIntString(long value) {
        return NUMBER_AS_INT_STRING.format(value);
    }

    /**
     * 45435.90111-->45436.90
     * 43.45-->43.45
     * @param value
     * @return
     */
    public static String formateDoubleAsIntPointString(double value) {
        return NUMBER_AS_INT_AND_POINT_STRING.format(value);
    }

    public static String format(BigDecimal b) {
        String ret = "";
        if (b == null) {
            return ret;
        }
        try {
            ret = MONEY_FORMATE.format(b.doubleValue());
        } catch (Exception e) {
            ret = b.toString();
        }
        return ret;
    }

    public static String format(Object obj) {
        if (obj == null) {
            return "";
        }
        if (obj instanceof Double) {
            return format((Double) obj);
        }
        if (obj instanceof Float) {
            return format((Float) obj);
        }
        if (obj instanceof BigDecimal) {
            return format((BigDecimal) obj);
        }
        return obj.toString();
    }

    public static String format(double d) {
        return format(new Double(d));
    }

    public static String format(Double d) {
        String ret = "";
        if (d == null) {
            return ret;
        }
        try {
            ret = MONEY_FORMATE.format(d.doubleValue());
        } catch (Exception e) {
            ret = d.toString();
        }
        return ret;
    }
    public static String formatPrice(Double d) {
        String ret = "";
        if (d == null) {
            return ret;
        }
        try {
            ret = MONEY_FORMATE.format(d.doubleValue());
        } catch (Exception e) {
            ret = d.toString();
        }
        return ret+"元";
    }
    public static String formatPriceAcreage(Double d) {
        String ret = "";
        if (d == null) {
            return ret;
        }
        try {
            ret = MONEY_FORMATE.format(d.doubleValue());
        } catch (Exception e) {
            ret = d.toString();
        }
        return ret+"元/㎡";
    }
    public static String formatAcreage(Double d) {
        String ret = "";
        if (d == null) {
            return ret;
        }
        try {
            ret = MONEY_FORMATE.format(d.doubleValue());
        } catch (Exception e) {
            ret = d.toString();
        }
        return ret+"/㎡";
    }


    public static String format(Double value, String defaultValue) {
        if (value == null) {
            return defaultValue;
        } else {
            return MONEY_FORMATE.format(value);
        }
    }

    public static String format(Double value, String defaultValue,
            NumberFormat format) {
        if (value == null) {
            return defaultValue;
        } else {
            return format.format(value);
        }
    }

    public static String format(float f) {
        return format(new Float(f));
    }

    public static String format(Float f) {
        String ret = "";
        if (f == null) {
            return ret;
        }
        try {
            ret = MONEY_FORMATE.format(f.doubleValue());
        } catch (Exception e) {
            ret = f.toString();
        }
        return ret;
    }

    public static String format(Long value, String defaultValue,
            NumberFormat format) {
        if (value == null) {
            return defaultValue;
        } else {
            return format.format(value);
        }
    }
}
