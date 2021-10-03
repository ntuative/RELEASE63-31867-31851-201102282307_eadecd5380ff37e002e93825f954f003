package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1928:int = 0;
      
      public static const const_1617:int = 1;
      
      public static const const_1565:int = 2;
      
      public static const const_1856:int = 3;
      
      public static const const_1823:int = 4;
      
      public static const const_1809:int = 5;
      
      public static const const_1472:int = 10;
      
      public static const const_1854:int = 11;
      
      public static const const_1832:int = 12;
      
      public static const const_1889:int = 13;
      
      public static const const_1898:int = 16;
      
      public static const const_1739:int = 17;
      
      public static const const_1883:int = 18;
      
      public static const const_1732:int = 19;
      
      public static const const_1906:int = 20;
      
      public static const const_1750:int = 22;
      
      public static const const_1933:int = 23;
      
      public static const const_1887:int = 24;
      
      public static const const_1818:int = 25;
      
      public static const const_1882:int = 26;
      
      public static const const_1830:int = 27;
      
      public static const const_1942:int = 28;
      
      public static const const_1852:int = 29;
      
      public static const const_1787:int = 100;
      
      public static const const_1746:int = 101;
      
      public static const const_1761:int = 102;
      
      public static const const_1793:int = 103;
      
      public static const const_1899:int = 104;
      
      public static const const_1824:int = 105;
      
      public static const const_1864:int = 106;
      
      public static const const_1800:int = 107;
      
      public static const const_1931:int = 108;
      
      public static const const_1901:int = 109;
      
      public static const const_1907:int = 110;
      
      public static const const_1719:int = 111;
      
      public static const const_1737:int = 112;
      
      public static const const_1816:int = 113;
      
      public static const const_1908:int = 114;
      
      public static const const_1905:int = 115;
      
      public static const const_1813:int = 116;
      
      public static const const_1754:int = 117;
      
      public static const const_1847:int = 118;
      
      public static const const_1873:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1617:
            case const_1472:
               return "banned";
            case const_1565:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
