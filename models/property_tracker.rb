require("pg")

class PropertyTracker
  #not good idea to use the term tracker as this is what the app is going to do

  attr_accessor :address, :value, :bedrooms, :build

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @address = options["address"]
    @value = options["value"].to_i
    @bedrooms = options["bedrooms"].to_i
    @build = options["build"]
  end


  def save()
    db = PG.connect({
                dbname: "property_tracker",
                host: "localhost"
                })
    sql = "INSERT INTO property_tracker
    (address, value, bedrooms, build)
    VALUES
    ($1, $2, $3, $4) RETURNING id"
    values =[@address, @value, @bedrooms, @build]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values).first()["id"].to_i
    db.close()
  end

  def delete()
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "DELETE FROM property_tracker WHERE id = $1"
      values = [@id]
      db.prepare("delete_one", sql)
      db.exec_prepared("delete_one", values)
      db.close
  end

  def update()
    db = PG.connect({
        dbname: "property_tracker",
        host: "localhost"
        })
      sql = "UPDATE property_tracker
        SET
        (address, value, bedrooms, build) =
        ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@address, @value, @bedrooms, @build, @id]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close()
      end

    # def find_by_id(id)
    #   db = PG.connect({dbname: 'property_tracker', host:
        # 'localhost'})
    #     sql = "SELECT * FROM property_tracker WHERE id = $1"
    #     value =[id]
    #     db.prepare("find", sql)
    #     results_array = db.exec_prepared("find", values')
    #     db.close()
          # property_hash = results_array[0]
          # found_property = Property.new(property_hash)
    #     return found_property
    #   end


  def self.all()
    db = PG.connect({
      dbname: "property_tracker",
      host: "localhost"
      })
    sql = "SELECT * FROM property_tracker"
    db.prepare("all", sql)
    properties = db.exec_prepared("all")
    db.close()
    return properties.map { |order| PropertyTracker.new(properties) }
  end

  def self.delete_all()
    db = PG.connect({
        dbname: "property_tracker",
        host: "localhost"
        })
      sql = "DELETE FROM property_tracker"
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all")
      db.close()
  end





end
