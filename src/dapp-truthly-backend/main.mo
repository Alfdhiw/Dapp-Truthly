import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Array "mo:base/Array";
import AIHelper "ai_helper"

actor NewsVerifier {
  // Data berita terverifikasi (judul, hasil, confidence %)
  var news_db : [(Text, Text, Nat)] = [];

  // Fungsi untuk memverifikasi berita menggunakan AI sederhana
  public shared func verifyNews(title : Text, content : Text) : async (Text, Nat) {
    let (result, confidence) = AIHelper.analyze(content);
   news_db := Array.append([(title, result, confidence)], news_db); // Menambahkan berita ke database
    return (result, confidence);
  };

  // Fungsi untuk mengambil daftar berita yang telah diverifikasi
  public query func getVerifiedNews() : async [(Text, Text, Nat)] {
    return news_db;
  };

  // Sistem penyimpanan stable agar data tidak hilang setelah upgrade
  stable var stable_news_db : [(Text, Text, Nat)] = [];

  system func preupgrade() {
    stable_news_db := news_db; // Simpan data sebelum upgrade
  };

  system func postupgrade() {
    news_db := stable_news_db; // Pulihkan data setelah upgrade
  };
};
