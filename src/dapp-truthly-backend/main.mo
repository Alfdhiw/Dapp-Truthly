import Debug "mo:base/Debug";
import Text "mo:base/Text";
import LlmCanister "canister:llm";

actor HoaxVerifier {

  type chat_message = { content : Text; role : { #user } };
  type chat_request = { messages : [chat_message]; model : Text };

  public shared func checkNews(newsText : Text) : async Text {
    if (Text.size(newsText) < 10) {
      return "Input berita terlalu pendek untuk dianalisis.";
    };

    let prompt : Text = "Saya memiliki berita berikut:\n\n" # newsText # "\n\n" #
    "Tolong analisis berita ini dan tentukan apakah ini hoax atau fakta berdasarkan sumber terpercaya.";

    let request : chat_request = {
      messages = [{ content = prompt; role = #user }];
      model = "llama3.1:8b";
    };

    let result = await LlmCanister.v0_chat(request);
    return result;
  };
};
