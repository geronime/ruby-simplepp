#encoding:utf-8
require 'ruby-simplepp/version'

module SimplePP

	def self.pp struct, indent_level=0, indent_str='  '
		str, indent, indent_in = '',
			indent_str * indent_level, indent_str * (indent_level + 1)
		if struct.kind_of?(Array)
			if struct.empty?
				str += '[]'
			else
				str += "[\n"
				lastidx = struct.length - 1
				struct.each_with_index{|v, i|
					str += indent_in + inner_pp(v, indent_level, indent_str)
					str += ',' unless i == lastidx
					str += "\n"
				}
				str += indent + "]"
			end
		elsif struct.kind_of?(Hash)
			if struct.empty?
				str += '{}'
			else
				key_maxl = 0
				struct.each_key{|k|
					l = inner_pp(k, indent_level, indent_str).length and
						l > key_maxl and key_maxl = l
				}
				str += "{\n"
				idx, lastidx = 0, struct.length - 1
				struct.each_pair{|k, v|
					str += indent_in + sprintf("%-#{key_maxl}s => %s",
							inner_pp(k, indent_level, indent_str),
							inner_pp(v, indent_level, indent_str)
						)
					str += ',' unless idx == lastidx
					idx += 1
					str += "\n"
				}
				str += indent + "}"
			end
		else
			str += inner_pp struct, indent_level, indent_str
		end
		str
	end

	private

	def self.inner_pp val, indent_level, indent_str
		val.kind_of?(Numeric) ||
				val.kind_of?(TrueClass) || val.kind_of?(FalseClass) ?
			val.to_s :
			val.kind_of?(Symbol) ?
				":#{val.to_s}" :
				val.kind_of?(NilClass) ?
					"nil" :
					val.kind_of?(Array) || val.kind_of?(Hash) ?
						pp(val, indent_level + 1) :
						"\"#{val.to_s.sub('"', '\"')}\""
	end

end # SimplePP

