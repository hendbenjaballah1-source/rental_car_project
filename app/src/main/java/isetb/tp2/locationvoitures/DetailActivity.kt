package isetb.tp2.locationvoitures

import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class DetailActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        val image = intent.getIntExtra("image", 0)
        val adresse = intent.getStringExtra("adresse") ?: ""
        val nom = intent.getStringExtra("nom") ?: ""
        val btnRes =findViewById<Button>(R.id.btnRes).setOnClickListener { Toast.makeText(this,"voiture réservée",Toast.LENGTH_SHORT).show() }


        findViewById<ImageView>(R.id.imgDetail).setImageResource(image)
        findViewById<TextView>(R.id.tvNomDetail).text = nom
        findViewById<TextView>(R.id.tvAdresseDetail).text = adresse

        findViewById<Button>(R.id.btnRetour).setOnClickListener { finish() }
    }
}