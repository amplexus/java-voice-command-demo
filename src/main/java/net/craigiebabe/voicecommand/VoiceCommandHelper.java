package net.craigiebabe.voicecommand;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import opennlp.tools.doccat.DoccatModel;
import opennlp.tools.doccat.DocumentCategorizerME;
import opennlp.tools.util.InvalidFormatException;

public class VoiceCommandHelper {
	
	public enum EnumCommand {
		INVALID,
		LEFT,
		RIGHT,
		FORWARD,
		BACKWARD,
	} ;
	
	public static boolean isCommand(ArrayList<String> textMatchList) {
		for(String word : textMatchList) {
			if(word.contains("boss"))
				return true;
		}
		return false;
	}

	static DocumentCategorizerME myCategorizer = null;
	
	/**
	 * See http://opennlp.apache.org/documentation/1.5.2-incubating/manual/opennlp.html
	 * 
	 * @param textMatchList
	 * @return
	 * @throws InvalidFormatException
	 * @throws IOException
	 */
	public static EnumCommand identifyCommand(InputStream trainerInputStream, StringBuffer inputText) throws InvalidFormatException, IOException {
		if(myCategorizer == null) {
			DoccatModel model = new DoccatModel(trainerInputStream);
			myCategorizer = new DocumentCategorizerME(model);
		}
		double[] outcomes = myCategorizer.categorize(inputText.toString());
		String category = myCategorizer.getBestCategory(outcomes);
		EnumCommand command ;
		try {
			command = EnumCommand.valueOf(category);
		} catch (Exception e) {
			command = EnumCommand.INVALID;
		}
		return command;
	}
}
