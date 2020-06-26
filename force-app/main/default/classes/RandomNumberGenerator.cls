public class RandomNumberGenerator {
 
    public static integer randomint(integer count)
    {
       
       
        //Integer count = [SELECT COUNT() FROM Contact];
		//Integer rand = Math.floor(Math.random() * count).intValue();
		//Contact c = [SELECT Name FROM Contact LIMIT 1 OFFSET :rand];
		//
        //math.random gives random value between 0.0 and 1.0, multipy that by total number, 
        //then using math.floor it rounds to the nearest integer. boom, random number generator.
        Integer rand = Math.floor(Math.random() * count).intValue();
		return rand; 
    }
    
}