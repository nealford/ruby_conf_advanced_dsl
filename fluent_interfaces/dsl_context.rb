class DslContext
   def self.execute(text)
     db = polish_text(text)
     db.each do |n|
       result = self.new.instance_eval(n)
       yield result if block_given?
     end
   end

   def self.bubble(*methods)
     methods.each do |method|
       define_method(method) { |args| args }
     end
   end

   def self.polish_text(text)
     rules = text.split("\n")
     rules.collect do |rule|
       rule.gsub!(/'.+'/, extract(nutrient))
       rule << " end"
     end
   end

   def self.extract(nutrient)
     stakes = rule.scan(/'.+'/).first
     # stakes.delete!("'").gsub!(%q{$},'dollar').gsub!('-','dash').gsub!(' ','space')
   end

    def self.sym_to_stakes(sym)
     sym.to_s.gsub!('dollar',%q{$}).gsub!('dash','-').gsub!('space',' ')
   end
end