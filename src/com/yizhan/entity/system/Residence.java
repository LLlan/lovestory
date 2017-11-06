package com.yizhan.entity.system;

import com.yizhan.entity.Page;
/**
 * 
 * 标题：小区实体类
 * 作者：lj
 * 时间：2016-11-23
 */
public class Residence {
		public String RESIDENCE_ID;
		public String RESIDENCE_NAME;
		public String RESIDENCE_ADDRESS;
		public String TENEMENT_COMPANY;//物业公司
		public int HOUSEHOLDS;//户数
		public String RESPONSIBLE;//负责人
		public String PHONE; 
		
		public Page page;

		public Page getPage() {
			if(page==null)
				page = new Page();
			return page;
		}

		public void setPage(Page page) {
			this.page = page;
		}

		public String getRESIDENCE_ID() {
			return RESIDENCE_ID;
		}

		public void setRESIDENCE_ID(String rESIDENCE_ID) {
			RESIDENCE_ID = rESIDENCE_ID;
		}

		public String getRESIDENCE_NAME() {
			return RESIDENCE_NAME;
		}

		public void setRESIDENCE_NAME(String rESIDENCE_NAME) {
			RESIDENCE_NAME = rESIDENCE_NAME;
		}

		public String getRESIDENCE_ADDRESS() {
			return RESIDENCE_ADDRESS;
		}

		public void setRESIDENCE_ADDRESS(String rESIDENCE_ADDRESS) {
			RESIDENCE_ADDRESS = rESIDENCE_ADDRESS;
		}

		public String getTENEMENT_COMPANY() {
			return TENEMENT_COMPANY;
		}

		public void setTENEMENT_COMPANY(String tENEMENT_COMPANY) {
			TENEMENT_COMPANY = tENEMENT_COMPANY;
		}

		public int getHOUSEHOLDS() {
			return HOUSEHOLDS;
		}

		public void setHOUSEHOLDS(int hOUSEHOLDS) {
			HOUSEHOLDS = hOUSEHOLDS;
		}

		public String getRESPONSIBLE() {
			return RESPONSIBLE;
		}

		public void setRESPONSIBLE(String rESPONSIBLE) {
			RESPONSIBLE = rESPONSIBLE;
		}

		public String getPHONE() {
			return PHONE;
		}

		public void setPHONE(String pHONE) {
			PHONE = pHONE;
		}
		
		
		
		
}
