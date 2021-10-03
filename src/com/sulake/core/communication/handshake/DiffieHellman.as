package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_858:BigInteger;
      
      private var var_2159:BigInteger;
      
      private var var_1780:BigInteger;
      
      private var var_2514:BigInteger;
      
      private var var_1408:BigInteger;
      
      private var var_1779:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1408 = param1;
         this.var_1779 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1408.toString() + ",generator: " + this.var_1779.toString() + ",secret: " + param1);
         this.var_858 = new BigInteger();
         this.var_858.fromRadix(param1,param2);
         this.var_2159 = this.var_1779.modPow(this.var_858,this.var_1408);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1780 = new BigInteger();
         this.var_1780.fromRadix(param1,param2);
         this.var_2514 = this.var_1780.modPow(this.var_858,this.var_1408);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2159.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2514.toRadix(param1);
      }
   }
}
