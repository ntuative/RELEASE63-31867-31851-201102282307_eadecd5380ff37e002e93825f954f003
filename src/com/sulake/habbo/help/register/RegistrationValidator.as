package com.sulake.habbo.help.register
{
   import com.sulake.core.utils.Map;
   
   public class RegistrationValidator
   {
      
      public static const const_1451:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
      
      public static const const_1582:RegExp = /[0-9]/;
      
      public static const const_1580:RegExp = /[a-zA-Z]/;
       
      
      public function RegistrationValidator()
      {
         super();
      }
      
      public static function validateRegistrationData(param1:String, param2:String, param3:Boolean, param4:Map) : void
      {
         validateEmail(param1,param4);
         validatePassword(param2,param4);
         validateTerms(param3,param4);
      }
      
      private static function validateEmail(param1:String, param2:Map) : void
      {
         if(param1 == null || !param1.match(const_1451))
         {
            param2.add("email","invalid-email-address");
         }
      }
      
      private static function validatePassword(param1:String, param2:Map) : void
      {
         if(param1 == null || param1.length == 0)
         {
            param2.add("password","enter-a-password");
            return;
         }
         if(param1.length < 6 || param1.length > 32)
         {
            param2.add("password","password-not-correct-length");
            return;
         }
         if(!hasLetter(param1))
         {
            param2.add("password","password-must-contain-letters");
            return;
         }
         if(!hasDigit(param1))
         {
            param2.add("password","password-must-contain-digits");
         }
      }
      
      private static function hasDigit(param1:String) : Boolean
      {
         if(param1.match(const_1582))
         {
            return true;
         }
         return false;
      }
      
      private static function hasLetter(param1:String) : Boolean
      {
         if(param1.match(const_1580))
         {
            return true;
         }
         return false;
      }
      
      private static function validateTerms(param1:Boolean, param2:Map) : void
      {
         if(!param1)
         {
            param2.add("terms","agree-terms");
         }
      }
   }
}
