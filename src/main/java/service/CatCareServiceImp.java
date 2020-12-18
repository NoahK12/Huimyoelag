package service;

import java.util.Calendar;

import dao.CatCareDAO;

public class CatCareServiceImp implements CatCareService {
	private CatCareDAO dao;

	public CatCareServiceImp() {
	}

	public void setDao(CatCareDAO dao) {
		this.dao = dao;
	}


	/*나이계산기*/
	@Override
	public int ageProcess(int birthYear) {
		Calendar current = Calendar.getInstance();
		int currentYear = current.get(Calendar.YEAR);
		int age = currentYear - birthYear; 
		return age;
	}


	/* 권장칼로리 */
	@Override
	public int RecommendedProcess(double weight, String option) {
		int rkcal;
		System.out.println(option);
		if (option.equals("6개월미만")) {
			rkcal = (int) (weight * 100);
		} else if (option.equals("건강한성묘")) {
			rkcal = (int) (weight * 80);
		} else if (option.equals("운동량이적은성묘")) {
			rkcal = (int) (weight * 70);
		} else {
			rkcal = (int) (weight * 60);
		}
		return rkcal;
	}

	@Override
	public double catfatProcess(double circumference, double Calflength) {
		double fat = (1.5 * circumference) - (Calflength - 9); 

		return fat;
	}

}
