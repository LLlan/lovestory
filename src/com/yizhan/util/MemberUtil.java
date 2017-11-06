package com.yizhan.util;

public class MemberUtil  {
	
	protected static Logger logger = Logger.getLogger(MemberUtil.class);
	
	/**
	 * 会员界别和积分
	 * @param pd
	 * @return
	 */
	public static String getMemLevel(int integral){
		
		String level="";
		switch (integral>=0?(integral>=10?(integral>=20?(integral>=30?(integral>=40?5:4):3):2):1):-1) {
		
		case (1):
            level = "一星级会员";
            break;
        case (2):
        	level = "二星级会员";
            break;
        case (3):
        	level = "三星级会员";
            break;
        case (4):
        	level = "四星级会员";
            break;
        case (5):
        	level = "五星级会员";
            break;
        case (-1):
            System.out.println("你输入的数值不合法");
            break;
            
        default:
            System.out.println("default");
            break;
        }
		return level;
	}
	
	/**
	 * 会员界别和积分
	 * @param pd
	 * @return
	 */
	public static int getMemLevelNum(int integral){
		
		int levelnum=0;
		switch (integral>=0?(integral>=10?(integral>=20?(integral>=30?(integral>=40?5:4):3):2):1):-1) {
		
		case (1):
            levelnum = 1;
            break;
        case (2):
        	levelnum = 2;
            break;
        case (3):
        	levelnum = 3;
            break;
        case (4):
        	levelnum = 4;
            break;
        case (5):
        	levelnum = 5;
            break;
        case (-1):
            System.out.println("你输入的数值不合法");
            break;
            
        default:
            System.out.println("default");
            break;
        }
		return levelnum;
	}
	/**
	 * 会员界别和积分
	 * @param pd
	 * @return
	 */
	public static String getPayType(int type){
		
		String paytype="1";
		switch (type) {
		case (0):
			paytype = "1";
            break;
		case (1):
			paytype = "1";
            break;
        case (2):
        	paytype = "2";
            break;
        case (3):
        	paytype = "1_2";
            break;
        default:
        	paytype = "1";
            break;
        }
		return paytype;
	}
}
