package isetb.tp2.locationvoitures

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val btnSeConnecter = findViewById<Button>(R.id.btnSeConnecter)
        val btnSinscrire = findViewById<Button>(R.id.btnSinscrire)

        btnSeConnecter.setOnClickListener {
            startActivity(Intent(this, Login::class.java))
        }

        btnSinscrire.setOnClickListener {
            startActivity(Intent(this, CreerCompte::class.java))
        }

        val images = listOf(R.drawable.car1, R.drawable.car2, R.drawable.car3)
        val adresses = listOf(
            "Avenue Habib Bourguiba, Tunis",
            "Aéroport Tunis-Carthage",
            "Centre-ville, Sousse"
        )


        val ouvrirDetail: (Int) -> Unit = { i ->
            val intent = Intent(this, DetailActivity::class.java)
            intent.putExtra("image", images[i])
            intent.putExtra("adresse", adresses[i])
            intent.putExtra("nom", "Voiture ${i + 1}")
            startActivity(intent)
        }

        val rv1 = findViewById<RecyclerView>(R.id.rvHorizontal1)
        rv1.layoutManager = LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)
        rv1.adapter = VoitureAdapter(images, adresses, ouvrirDetail)

        val rv3 = findViewById<RecyclerView>(R.id.rvHorizontal3)
        rv3.layoutManager = LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false)
        rv3.adapter = VoitureAdapter(images, adresses, ouvrirDetail)
    }
}