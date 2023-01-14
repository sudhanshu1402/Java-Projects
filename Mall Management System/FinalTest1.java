import java.io.*; 
import java.awt.image.BufferedImage; 
import javax.imageio.ImageIO;
import java.util.*;


//main class

class FinalTest1{
public static void main(String[] args) throws Exception
{
int l,i,p,q;
Scanner d= new Scanner(System.in);
System.out.println("\nWelcome to PALLADIUM MALL MANAGEMENT SYSTEM!!");
System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
p1 o1 = new p1();
a11 oo1= new a11();
p1 o2 = new p1();
s1 oo2= new s1();
p1 o3= new p1();
c1 oo3= new c1();

do{
System.out.println("SELECT ANY ONE \n1.Admin \n2.Shop Owner \n3.Customer");
 l=d.nextInt();
switch(l)
{
case 1: p=o1.person_details(1);
         if(p==1)
         { 
           System.out.println("LOGIN SUCCESS!!!! \n*******WELCOME ADMIN*******");
           oo1.select();
         }
         else{
               System.out.println("***Incorrect Username or Password***");
             }
        break;

 case 2: q=o2.person_details(2);
        if(q<10 && q>-1)
         { 
          System.out.println("LOGIN SUCCESS!!!! \n*******WELCOME SHOP OWNER*****");
          oo2.select(q);
         }
         else{
               System.out.println("***Incorrect Username or Password***");
             }
        break;

case 3: o3.person_details(3);
        System.out.println("******WELCOME CUSTOMER !!*********");
        oo3.select();
        break;

default : System.out.println("Enter valid option");
}
System.out.println("Press 1 to Retry!!!");
i=d.nextInt();
}while(i==1);

}
}
//main class end





//person class
abstract class person{
abstract int person_details(int u) throws Exception ; 
}  


class p1 extends person {
String name,email,address,phone_no;
int q1=-1,i,j;
int person_details(int u) throws Exception 
{
String usa,pwa,uss,pws;


Scanner sc=new Scanner(System.in);

System.out.println("Enter Name");
name=sc.nextLine();

System.out.println("Enter Email ID");
email=sc.nextLine();

System.out.println("Enter Address");
address=sc.nextLine();

System.out.println("Enter Phone_no");
phone_no=sc.nextLine();


//login for admin
if(u==1)
 { 
   System.out.println("Enter username :");
   usa=sc.nextLine();
   System.out.println("Enter password :");
   pwa=sc.nextLine();
   
   File file = new File("C:\\Users\\HP\\Desktop\\project\\admin_up.txt");  
   Scanner g =new Scanner(file);

   
   String[] c =new String[5];                       
   i=0;

  while(g.hasNextLine())
  {
  c[i]=g.nextLine();
  i++;
  }
    
  //System.out.println("c[0]="+c[0]+"length"+c[0].length());
 // System.out.println("c[1]="+c[1]+"length"+c[1].length());
 // System.out.println("usa="+usa+"length"+usa.length());
  //System.out.println("pwa="+pwa+"length"+pwa.length());

  if((c[0].compareTo(usa)==0)  && (c[1].compareTo(pwa)==0) )
   {q1= 1;}
else
   {q1= 0;}
  

 }
//end of login for admin


//login for shop owners
if(u==2)
{

   System.out.println("Enter username :");
   uss=sc.nextLine();
   System.out.println("Enter password :");
   pws=sc.nextLine();
   
   File file = new File("C:\\Users\\HP\\Desktop\\project\\shop_owner_up.txt"); 
   Scanner h =new Scanner(file);

   String[][] r = new String[10][2];
   i=0;j=0;

   for(i=0;i<10;i++)
    {
      for(j=0;j<2;j++)
       {
         r[i][j]=h.nextLine();
       }
    }
   
   for(i=0;i<10;i++)
   {
    if( (uss.compareTo(r[i][0])==0) && (pws.compareTo(r[i][1])==0) )
     {    q1=i;
     }
   }
 
 } //if close
    



//System.out.println("q1="+q1);
return q1;
}
}

// person class end




//admin class 

abstract class admin{
abstract void floor_plan() throws Exception;
abstract void shop_mngmt() throws Exception;
abstract void emp_mngmt()throws Exception;
}




class a11 extends admin{

 int i,j;
void select() throws Exception
{
System.out.println("SELECT OPTION\n1.Floor plan \n2.Shop management  \n3.Employee management");
Scanner iv = new Scanner(System.in);
int n =iv.nextInt();
switch(n)
{
case 1 : floor_plan();
         break;
case 2 : shop_mngmt();
         break;
case 3 : emp_mngmt();
         break;
default : System.out.println("please enter correct choice");
}

}

void floor_plan() throws Exception
{
int f1,i,j;
Scanner sc= new Scanner(System.in);
System.out.println("Enter floor number ");
f1=sc.nextInt();

switch(f1)
{
    case 1:  int width1 = 963;    
        int height1 = 640;   
  
        BufferedImage image = null; 
  
        try
        { 
            File input_file1 = new File("C:\\Users\\HP\\Desktop\\project\\1st_floor.txt");  
  
        
            image = new BufferedImage(width1, height1, 
                                    BufferedImage.TYPE_INT_ARGB); 
  
        
            image = ImageIO.read(input_file1); 
  
            System.out.println(" Floor plan for 1st floor"); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Error: "+e); 
        } 
       break;
        case 2:  int width2 = 963;    
        int height2 = 640;   
  
        BufferedImage image1 = null; 
  
        try
        { 
            File input_file2 = new File("C:\\Users\\HP\\Desktop\\project\\2nd_floor.txt");  
  
        
            image1 = new BufferedImage(width2, height2, 
                                    BufferedImage.TYPE_INT_ARGB); 
  
        
            image1 = ImageIO.read(input_file2); 
  
            System.out.println(" Floor plan for 2nd floor"); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Error: "+e); 
        } 
      break;
        case 3:  int width3 = 963;    
        int height3 = 640;   
  
        BufferedImage image2 = null; 
  
        try
        { 
            File input_file3 = new File("C:\\Users\\HP\\Desktop\\project\\3rd_floor.jpg");    
        
            image2 = new BufferedImage(width3, height3, 
                                    BufferedImage.TYPE_INT_ARGB); 
  
        
            image2 = ImageIO.read(input_file3); 
  
            System.out.println("Floor plan for 3rd floor"); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Error: "+e); 
        } 
       break;
default : System.out.println("There are only 3 floors! Please choose the correct option !!");
}
}

void shop_mngmt()throws Exception
{
int m1;
Scanner sc1=new Scanner(System.in);
System.out.println("Enter\n1.Add shop\n2.Remove shop\n3.show shop details");
m1=sc1.nextInt();

   File file = new File("C:\\Users\\HP\\Desktop\\project\\shop_details.txt");
   Scanner g99 =new Scanner(file);

   
   String[][] sd =new String[11][3];                       
   i=0;j=0;

   for(i=0;i<11;i++)
    {
      for(j=0;j<3;j++)
       {
         sd[i][j]=g99.nextLine();
       }
    }
   
   

switch (m1)
{
case 1:
        break;
case 2:
         break;
case 3:   i=0;j=0;
          for(i=0;i<11;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.print("  "+sd[i][j]+"  ");
             }
            System.out.println("        ");
           }
         break;
default : System.out.println("Please choose the correct option ");
}
}

void emp_mngmt() throws Exception
{
Scanner s=new Scanner(System.in);
System.out.println("Enter \n1.Add Employee \n2.Remove Employee \n3.Show employee details");
int m2=s.nextInt();

File file = new File("C:\\Users\\HP\\Desktop\\project\\emp_details.txt");      
   Scanner gm =new Scanner(file);

   
   String[][] ed =new String[11][3];                       
   i=0;j=0;

   for(i=0;i<11;i++)
    {
      for(j=0;j<3;j++)
       {
         ed[i][j]=gm.nextLine();
       }
    }



switch (m2)
{
case 1:
case 2:
case 3:  i=0;j=0;
for(i=0;i<11;i++)
{ 
for(j=0;j<3;j++)
{ 
System.out.print("      "+ed[i][j]+"       ");
}
 System.out.println("");
 }
  break;
default : System.out.println();
}
}



}
//admin class end






//shop owner class

abstract class shopowner{
abstract void employee_mngmt(int v1)throws Exception;
abstract void shopdet(int v2)throws Exception;
abstract void inventory(int v3)throws Exception;
}







class s1 extends shopowner{

int i,j;

void select( int v) throws Exception
{
System.out.println("SELECT OPTION:\n1.Employee management \n2. Shop_details \n3. Inventory details");
Scanner iv = new Scanner(System.in);
int n =iv.nextInt();
switch(n)
{
case 1 : employee_mngmt(v);
         break;
case 2 : shopdet(v);
         break;
case 3 : inventory(v);
         break;
default : System.out.println();
}

}


void employee_mngmt(int v1) throws Exception
{

 
  int i=0;j=0;

switch (v1)
{
case 0: File file = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss1.txt");  
   Scanner gk =new Scanner(file);
   for(i=1;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk.nextLine());
             }
            System.out.println("********************");
           }
    
       break;
case 1: File file2 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss2.txt");
   Scanner gk2=new Scanner(file2);
   
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk2.nextLine());
             }
            System.out.println("*********************");
           }

       break;
case 2:File file3 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss3.txt");  
   Scanner gk3=new Scanner(file3);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk3.nextLine());
             }
            System.out.println("********************");
           }

        break;
case 3:File file4 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss4.txt"); 
   Scanner gk4 =new Scanner(file4);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk4.nextLine());
             }
            System.out.println("********************");
           }

       break;
case 4:File file5 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss5.txt"); 
   Scanner gk5 =new Scanner(file5);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk5.nextLine());
             }
            System.out.println("********************");
           }

       break;
case 5:File file6 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss6.txt");  
   Scanner gk6=new Scanner(file6);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk6.nextLine());
             }
            System.out.println("********************");
           }

        break;
case 6:File file7 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss7.txt"); 
   Scanner gk7 =new Scanner(file7);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk7.nextLine());
             }
            System.out.println("********************");
           }

       break;
case 7:File file8 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss8.txt");  
   Scanner gk8 =new Scanner(file8);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk8.nextLine());
             }
            System.out.println("********************");
           }

       break;
case 8:File file9 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss9.txt");
   Scanner gk9=new Scanner(file9);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk9.nextLine());
             }
            System.out.println("********************");
           }

        break;
case 9: File file10 = new File("C:\\Users\\HP\\Desktop\\project\\emp_detailss10.txt");  
   Scanner gk10 =new Scanner(file10);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gk10.nextLine());
             }
            System.out.println("********************");
           }

        break;

default : System.out.println("Error");
}
 
 

}





void shopdet(int v2)throws Exception{




switch (v2)
{
case 0: System.out.println("Nike is a great addition to Palladium Mall and its authenticated brands make it more famous shop in our mall");      

       break;
case 1:System.out.println("Voted as'India's Most Trusted Apparel Retail Brand,Brand Equity Survey 2014/2015, Pantaloons, a division of ABFRL has always been one of the most loved large format fashion retailers in India. Pantaloons is today the fastest growing large format retailer in the country");
       break;
case 2: System.out.println("Launched in the UAE in May 2004, Max was established in India in 2006, opening its first store in Indore. Now, Max India has a reach that extends to over 60 cities. Boasting a loyal customer base of over 5.5 million, Max is the most profitable value fashion format in the region.Max offers apparel, footwear and accessories for the entire family - women, men and children. Customers can expect a world-class shopping environment stocking the latest in international fashion from around the globe, as well as Max's own label of in-house designs in carefully chosen colour palettes. Shoppers enjoy great prices on an excellent range of over 3,000 styles every season, in brand new designs, silhouettes and fabrics.");

        break;
case 3:System.out.println("Adidas has its roots in Germany but we are a truly global company. Around the world we employ over 59,000 people. Employees from about 100 nations are working at our global HQ in Herzogenaurach, Germany the World of Sports. In 2019 we produced over 1.1 billion sports and sports lifestyle products with independent manufacturing partners worldwide and generated sales of 23.640 billion. These numbers alone can easily suggest that adidas is quite a large and also multifaceted organization.But we keep things simple, lean and fast. And we will use this approach now to give an overview of what our company is all about");

       break;
case 4:System.out.println("Puma SE, branded as Puma, is a German multinational corporation that designs and manufactures athletic and casual footwear, apparel and accessories, which is headquartered in Herzogenaurach, Bavaria, Germany. Puma is the third largest sportswear manufacturer in the world");
       break;
case 5:System.out.println("HyperCity, a premium chain of 19 hypermarkets from Shoppers Stop for Rs 700 crore through a combination of cash and shares to further consolidate his footprint in western India, said multiple sources aware. A formal announcement is expected tomorrow after the board meeting of Future Retail.The loss making supermarket chain that opened its first store in 2006 is a subsidiary of Shoppers Stop, which owns a 51 per cent stake while parent K Raheja Corp holds the rest.");
        break;
case 6:System.out.println("Shoppers Stop is an Indian department store chain, owned by the K Raheja Corp. There are 86 stores across 40 cities in India, with clothing, accessories, handbags, shoes, jewellery, fragrances, cosmetics, health and beauty products, home furnishing and decor products");

       break;
case 7:System.out.println("Brand Factory is a chain of retail stores operated by Future Group. Its head office is in Mumbai. Launched in September 2006, it has 100 stores across 50 cities in India as of December 2018. It is India's largest discount retail chain and offers a wide range of apparel brands in different categories for men, women, infants, accessories, cosmetics, footwear, sportswear and luggage.");

       break;
case 8:System.out.println("Our lead fashion brand with over 22 labels all designed in-house, across womens wear, menswear, kidswear, footwear, lingerie, cosmetic, perfumes, accessories and home furniture.");

        break;
case 9: System.out.println("Hamleys is a British multinational toy retailer, one of the oldest and largest in the world, owned by the Indian company Reliance Retail.It was founded by William Hamley as Noah's Ark in High Holborn, London, in 1760, it moved to its current site on Regent Street in 1881. This flagship store is set over seven floors, with more than 50,000 lines of toys on sale. It is considered one of the city's prominent tourist attractions, receiving around five million visitors each year. The chain has 25 other outlets in the United Kingdom and also has more than 90 franchises worldwide.");

        break;
default : System.out.println("NO MORE SHOPS AVAILABLE!!");
}


}




void inventory(int v3)throws Exception{

                    
  int i=0;j=0;

switch(v3)
{
case 0:File file = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss1.txt");   
 
   Scanner gn=new Scanner(file);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn.nextLine());
             }
            System.out.println("********************");
           }

       break;
case 1:File file2 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss2.txt");
   Scanner gn2=new Scanner(file2);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn2.nextLine());
             }
            System.out.println("********************");
           }

       break;
case 2:File file3 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss3.txt");
   Scanner gn3=new Scanner(file3);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn3.nextLine());
             }
            System.out.println("********************");
           }
        break;
case 3:File file4 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss4.txt");
  Scanner gn4=new Scanner(file4);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn4.nextLine());
             }
            System.out.println("********************");
           }
       break;
case 4:File file5 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss5.txt");
   Scanner gn5=new Scanner(file5);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn5.nextLine());
             }
            System.out.println("********************");
           }
       break;
case 5:File file6 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss6.txt");
   Scanner gn6=new Scanner(file6);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn6.nextLine());
             }
            System.out.println("********************");
           }
        break;
case 6:File file7 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss7.txt");
   Scanner gn7=new Scanner(file7);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn7.nextLine());
             }
            System.out.println("********************");
           }
       break;
case 7:File file8 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss8.txt");
   Scanner gn8=new Scanner(file8);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn8.nextLine());
             }
            System.out.println("********************");
           }
       break;
case 8:File file9 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss9.txt");
   Scanner gn9=new Scanner(file9);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn9.nextLine());
             }
            System.out.println("********************");
           }
        break;
case 9: File file10 = new File("C:\\Users\\HP\\Desktop\\project\\inv_detailss10.txt");
   Scanner gn10=new Scanner(file10);
   for(i=0;i<3;i++)
           { 
            for(j=0;j<3;j++)
             { System.out.println(gn10.nextLine());
             }
            System.out.println("********************");
           }
        break;
default:System.out.println();
}

 
}
}


// shop owner class end




//customer class




abstract class customer{
abstract void floor_plan() throws Exception;
abstract void mall_desc();
abstract void shop_list()throws Exception;
}


class c1 extends customer{


void select() throws Exception
{
int s1;
Scanner sc =new Scanner(System.in);
System.out.println("SELECT OPTION :\n1.Shop List \n2.Floor_plan  \n3.Mall_desc");
s1=sc.nextInt();
switch(s1)
{
case 1 :  shop_list() ;
         break;
case 2 :  floor_plan();
        break;
case 3 : mall_desc();
         break;
default : System.out.println();
}
}

void shop_list() throws Exception
{
 File file = new File("C:\\Users\\HP\\Desktop\\project\\shop_list.txt");  
   Scanner g1 =new Scanner(file);

   
   String[] c10 =new String[15];                       
   int i=0;

  while(g1.hasNextLine())
  {
  c10[i]=g1.nextLine();
  i++;
  }
  
  for(int j=0;j<=10;j++)
   { System.out.println("shop no."+(j+1)+"="+c10[j]);
   }
}






void floor_plan() throws Exception
{
int f1;
Scanner sc2= new Scanner(System.in);
System.out.println("Enter floor number ");
f1=sc2.nextInt();

switch(f1)
{
    case 1:  int width1 = 963;    
        int height1 = 640;   
  
        BufferedImage image = null; 
  
        try
        { 
            File input_file1 = new File("C:\\Users\\HP\\Desktop\\project\\1st_floor.txt");
  
        
            image = new BufferedImage(width1, height1, 
                                    BufferedImage.TYPE_INT_ARGB); 
  
        
            image = ImageIO.read(input_file1); 
  
            System.out.println(" floor plan"); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Error: "+e); 
        } 
       break;
    case 2:  int width2 = 963;    
        int height2 = 640;   
  
        BufferedImage image3 = null; 
  
        try
        { 
            File input_file2 = new File("C:\\Users\\HP\\Desktop\\project\\2nd_floor.txt");  
  
        
            image3 = new BufferedImage(width2, height2, 
                                    BufferedImage.TYPE_INT_ARGB); 
  
        
            image3 = ImageIO.read(input_file2); 
  
            System.out.println(" floor plan"); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Error: "+e); 
        } 
      break;
    case 3:  int width3 = 963;    
        int height3 = 640;   
  
        BufferedImage image4 = null; 
  
        try
        { 
            File input_file3 = new File("C:\\Users\\HP\\Desktop\\project\\3rd_floor.txt");
  
        
            image4 = new BufferedImage(width3, height3, 
                                    BufferedImage.TYPE_INT_ARGB); 
  
        
            image4 = ImageIO.read(input_file3); 
  
            System.out.println(" floor plan"); 
        } 
        catch(IOException e) 
        { 
            System.out.println("Error: "+e); 
        } 
       break;
default : System.out.println("There are only 3 floors! Please choose the correct option !!");
}

}



void  mall_desc()
{
{
System.out.println("Palladium is the most wonderful mall it has lots of Stuffs in a very high quality and many different well known brands to come... It's Supermarket is a fantastic place to buy so many fresh fruits and other products... Here are many delicious foods and desserts in special restaurants and Cafés to come... It's electronic shopping center is amazing with so many different brands of cell-phones, I pads and so on... Here are also many nice and stunning colourful clothes which you like to buy all of them! Lol :) ... You see also various sort of shops... And many other products which I recommend you to come and see... Although the prices are rather high, It worth it to come here and buy your requirements, due to It is luxury and has high quality Shoes... All in all, why you go somewhere else? Palladium has it all. \n*************************************************************\n Phone Number:287737388 / 34422324 / 23444453 \n****************************************************\n Mall Location:Tehran,Moqadase Ardebili St _ near alef Sq");
}
}

}


// customer class end 



//end of code
