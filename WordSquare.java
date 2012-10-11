/**
 * @author Nishant M.
 * @date 26-June-2012
 * @problem http://en.wikipedia.org/wiki/Word_square
 *
 */
public class WordSquare{
	
	public static void main(String[] args) {
		
		/*
		 * Example Test.
		 *------------------------------------------------------
		 *	   5			4		  3			2
		 * H E A R T	 H E A R	H E A		H E
		 * E M B E R	 E M B E	E M B		E M
		 * A B U S E	 A B U S	A B U
		 * R E S I N	 R E S I	
		 * T R E N D
		 * 
		 */
		String[] inputStrings = {"HEART","EMBER","ABUSE","RESIN","TREND"};
		String[][] arr = build2D(inputStrings);
		int lengthofword= inputStrings[0].length();	//ASSUMES all words of same length. Does not verify.
		System.out.println("Input is a Word Sqaure ?  "+isSquare(arr,lengthofword));
	}

	private static boolean isSquare(String[][] arr, int lengthofword) {
		if(lengthofword>2){
			if(isSquare(arr, lengthofword-1)){
				return getWords(arr, lengthofword);
			}
			else
				return false;
		}else{
			return getWords(arr,lengthofword);
		}
	}

	private static boolean getWords(String[][] arr, int lengthofword) {
		String one = "",two = "";
		for (int i = 0; i <lengthofword ; i++) {
			one+=arr[i][lengthofword-1];
			two+=arr[lengthofword-1][i];
		}
		if(one.equalsIgnoreCase(two))
			return true;
		else
			return false;
	}

	private static String[][] build2D(String[] in) {
		String[][] arr = new String[in.length][in.length];
		for (int i = 0; i < in.length; i++) {
			for (int j = 0; j < in.length; j++) {
				arr[i][j]=""+in[i].charAt(j);
			}
		}
		return arr;
	}
}