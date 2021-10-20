import java.util.Scanner;

public class geology
{
    public static void main(String[] args)
    {   
        String response = "";
    
        do {
        System.out.print("\n");
        System.out.println("Please enter one of the following minerals or energy source, or E to exit:");
        System.out.print("\n");
        System.out.println("Minerals:\nFluorite      Aluminum\nCopper        Gold\nIron Ore      Lithium\nSilver        Tin");
        System.out.print("\n");
        System.out.println("Energy Sources:\nNuclear           Wind\nGeothermal        Solar\nHydrothermal      Biomass");
        System.out.print("\n");
        
        Scanner in = new Scanner(System.in);
        String user_input = in.nextLine(); //gets the persons response
        response = user_input;
        


        //switch statement for results
        switch(response) {
            //minerals: Fluorite, Aluminum, Copper, Gold , Iron Ore, Lithium, Silver, Tin
            case "Silver":
                System.out.print("1. Mexico\n2. Peru\n3. China\n4. Russia\n5. Poland\n6. Chile\n7. Bolivia\n8. Australia\n9. USA\n");
                break;

            case "Fluorite":
                System.out.print("1. China\n2. Mexico\n3. South Africa\n4. Russia\n5. Spain\n6. Mongolia\n7. Namibia\n8. Kenya\n9. Morocco\n10, Brazil\n");
                break;

            case "Aluminum":
                System.out.print("1. China\n2. India\n3. Russia\n4. Canada\n5. United Arab Emirates\n6. Australia\n7. Norway\n8. Bahrain\n9. Saudi Arabia\n10. USA\n");
                break;

            case "Copper":
                System.out.print("1. Chile\n2. Peru\n3. China\n4. USA\n5. Congo\n6. Australia\n7. Zambia\n8. Mexico\n9. Russia\n10. Indonesia\n");
                break;

            case "Gold":
                System.out.print("1. China\n2. Australia\n3. Russia\n4. USA\n5. Canada\n6. Peru\n7. Indonesia\n8. Ghana\n9. South Africa\n10. Mexico\n");   
                break;

            case "Lithium":
                System.out.print("1. Australia\n2. Chile\n3. China\n4. Argentina\n5. Zimbabwe\n6. Portugal\n7. Brazil\n8. Namibia\n9. Bolivia\n");    
                break;

            case "Iron Ore":
                System.out.print("1. Australia\n2. Brazil\n3. China\n4. India\n5. Russia\n6. South Africa\n7. Ukraine\n8. USA\n9. Canada\n10. Iran\n");
                break;

            case "Tin":
                System.out.print("1. China\n2. Indonesia\n3. Peru\n4. Bolivia\n5. Brazil\n6. Myanmar\n7. Australia\n8. Vietnam\n9. Malaysia\n10. Congo\n");
                break;

            //energy sources : Nuclear, Wind, Geothermal, Solar, Hydrothermal, Biomass
            case "Nuclear":
                System.out.print("1. USA\n2. France\n3. China\n4. Russia\n5. South Korea\n6. Canada\n7. Ukraine\n8. Germany\n9. United Kingdom\n10. Sweden\n");
                break;

            case "Wind":
                System.out.print("1. China\n2. USA\n3. Germany\n4. Spain\n5. India\n6. United Kingdom\n7. Canada\n8. France\n9. Italy\n10. Brazil\n");
                break;
            case "Geothermal":
                System.out.print("1. USA\n2. Indonesia\n3. Philippines\n4. Turkey\n5. New Zealand\n6. Mexico\n7. Italy\n8. Iceland\n9. Kenya\n10. Japan\n");
                break;
            case "Solar":
                System.out.print("1. Germany\n2. China\n3. Italy\n4. Japan\n5. USA\n6. Spain\n7. France\n8. United Kingdom\n9. Australia\n10. Belgium\n");
                break;
            case "Hydrothermal":
                System.out.print("1. China\n2. Brazil\n3. Canada\n4. USA\n5. Russia\n6. Norway\n7. India\n8. Venezuela\n9. Sweden\n10. Japan\n");
                break;
            case "Biomass":
                System.out.print("1. USA\n2. Brazil\n3. Indonesia\n4. Germany\n5. China\n6. France\n7. Argentina\n8. Thailand\n9. Netherlands\n10. Spain\n");
                break;
            } 
        } while(!response.equals("E"));
    }
}