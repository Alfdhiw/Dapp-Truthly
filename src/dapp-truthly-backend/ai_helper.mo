import Text "mo:base/Text";
import Nat "mo:base/Nat";

module {
    public func analyze(content : Text) : (Text, Nat) {
        let normalized = Text.toLowercase(content);

        if (Text.contains(normalized, #text "hoax")) { // Perbaiki pemanggilan fungsi
            return ("Berita ini kemungkinan HOAX", 85);
        } else if (Text.contains(normalized, #text "fakta")) {
            return ("Berita ini kemungkinan FAKTA", 90);
        } else {
            return ("Tidak dapat menentukan, butuh analisis lebih lanjut", 50);
        };
    };
};
