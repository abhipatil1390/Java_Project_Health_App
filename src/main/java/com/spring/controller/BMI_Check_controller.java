package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BMI_Check_controller {

	@RequestMapping("home")
	public String home_page() {

		return "NewFile";
	}

	@RequestMapping("result")
	public String result_page(@RequestParam("Height") String Height, @RequestParam("Heightvalue") String Heightvalue,
			@RequestParam("weight") String weight, @RequestParam("userName") String userName,
			@RequestParam("weightvalue") String weightvalue, Model m) {
		float Heightvalue1 = Float.parseFloat(Heightvalue);
		double weightvalue1 = Integer.parseInt(weightvalue);
		double lbsv = 0.45359237;
		double bmi = 0;
		double squre = 0;
		if (Height.equals("feet") && weight.equals("KG")) {

			squre = ((Heightvalue1 * 12 * 2.5) / 100);
			bmi = weightvalue1 / (squre * squre);

		} else

		if (Height.equals("feet") && weight.equals("LBS")) {

			squre = ((Heightvalue1 * 12 * 2.5) / 100);
			bmi = (lbsv * weightvalue1) / (squre * squre);

		} else

		if (Height.equals("meter") && weight.equals("KG")) {

			bmi = weightvalue1 / (Heightvalue1 * Heightvalue1);

		} else

		if (Height.equals("meter") && weight.equals("LBS")) {

			bmi = (lbsv * weightvalue1) / (squre * squre);

		}
		String condition = "Healthy Weight";
		if (bmi < 18.5) {
			condition = "Under Weight";
		} else if (bmi > 25) {
			condition = "Over Weight";
		}

		m.addAttribute("bmi", bmi);
		m.addAttribute("condition", condition);
		m.addAttribute("userName", userName);
		return "result";

	}

}
